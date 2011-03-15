//
//  LineGestureRecognizer.h
//  CustomGesture
//
//  Created by Andreas Katzian on 15.03.11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIGestureRecognizerSubclass.h>


typedef enum {
    CheckmarkFirstStrokeDown,
    CheckmarkSecondStrokeUp
} CheckmarkGestureState;


@interface CheckmarkGestureRecognizer : UIGestureRecognizer {
    
    CheckmarkGestureState _checkmarkState;
    CGPoint _turnPoint;
    CGPoint _startPoint;
    
}

- (void)resetCheckmark;

- (void)reset;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;


@end
