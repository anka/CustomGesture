//
//  LineGestureRecognizer.m
//  CustomGesture
//
//  Created by Andreas Katzian on 15.03.11.
//

#import "CheckmarkGestureRecognizer.h"


@implementation CheckmarkGestureRecognizer


// Reset our custom state members
- (void)resetCheckmark
{
    _checkmarkState = CheckmarkFirstStrokeDown;
    _turnPoint      = CGPointZero;
    _startPoint     = CGPointZero;
}

// Override the reset method. This methods gets
// called whenever the state changes to 
// UIGestureRecognizerStateFailed.
- (void)reset
{
    [super reset];
    [self resetCheckmark];
}

// Touch began on view so save the start point
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    if ([touches count] != 1) {
        self.state = UIGestureRecognizerStateFailed;
        return;
    }
    else
    {
        _startPoint = [[touches anyObject] locationInView:self.view];
    }
}

// Track the move of the current gesture
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    
    if (self.state == UIGestureRecognizerStateFailed)
        return;
    
    // Get the current and previous touch locations
    CGPoint newPoint    = [[touches anyObject] locationInView:self.view];
    CGPoint prevPoint   = [[touches anyObject] previousLocationInView:self.view];
    
    // If we track the first stroke
    if (_checkmarkState == CheckmarkFirstStrokeDown)
    {
        // While we move to the right and downwards 
        if (newPoint.x >= prevPoint.x && newPoint.y >= prevPoint.y)
        {
            // Keep the possible turn point of the stroke
            _turnPoint = newPoint;
        } 
        // Else if we change direction to the right and upwards
        else if (newPoint.x >= prevPoint.x && newPoint.y <= prevPoint.y)
        {
            // Set the state to observe the second stroke
            _checkmarkState = CheckmarkSecondStrokeUp;
        } 
        else 
        {
            // In any other case the gesture will fail
            self.state = UIGestureRecognizerStateFailed;
        }
    }// Else we track the second stroke
    else if(_checkmarkState == CheckmarkSecondStrokeUp)
    {
        if(newPoint.x < prevPoint.x)
            self.state = UIGestureRecognizerStateFailed;
    }
}

// Track the end of the gesture
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if ((self.state == UIGestureRecognizerStatePossible) && _checkmarkState == CheckmarkSecondStrokeUp)
    {
        // Get length of both strokes
        CGPoint endPoint = [[touches anyObject] locationInView:self.view];
        float lengthFirstStroke     = _turnPoint.y - _startPoint.y;
        float lengthSecondStroke    = _turnPoint.y - endPoint.y;
        
        // Checkmark gesture is valid if the second stroke has at
        // least 2-times the length of the first stroke
        if(lengthSecondStroke > lengthFirstStroke * 2.0)
        {
            // Set state to UIGestureRecognizerStateRecognized and
            // the gesture recognizer will call the defined action
            self.state = UIGestureRecognizerStateRecognized;
        }
        else
        {
            self.state = UIGestureRecognizerStateFailed;
        }
    }
}

// The gesture will fail if touche was cancelled
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesCancelled:touches withEvent:event];
    self.state = UIGestureRecognizerStateFailed;
}


@end
