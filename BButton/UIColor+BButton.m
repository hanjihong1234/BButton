//
//  UIColor+BButton.m
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice,
//  this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
// * Neither the name of Mathieu Bolard, mattlawer nor the names of its contributors
//  may be used to endorse or promote products derived from this software
//  without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
//  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL Mathieu Bolard BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
//  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  -----------------------------------------
//  Edited and refactored by Jesse Squires on 2 April, 2013.
//
//  http://github.com/jessesquires/BButton
//
//  http://hexedbits.com
//

#import "UIColor+BButton.h"

@implementation UIColor (BButton)

- (UIColor *)lightenColorWithValue:(CGFloat)value
{
    size_t totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if(isGreyscale) {
        newComponents[0] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[1] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[2] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] + value > 1.0 ? 1.0 : oldComponents[0] + value;
        newComponents[1] = oldComponents[1] + value > 1.0 ? 1.0 : oldComponents[1] + value;
        newComponents[2] = oldComponents[2] + value > 1.0 ? 1.0 : oldComponents[2] + value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

- (UIColor *)darkenColorWithValue:(CGFloat)value
{
    size_t totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if(isGreyscale) {
        newComponents[0] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[1] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[2] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] - value < 0.0 ? 0.0 : oldComponents[0] - value;
        newComponents[1] = oldComponents[1] - value < 0.0 ? 0.0 : oldComponents[1] - value;
        newComponents[2] = oldComponents[2] - value < 0.0 ? 0.0 : oldComponents[2] - value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

- (BOOL)isLightColor
{
    size_t totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *components = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat sum;
    
    if(isGreyscale) {
        sum = components[0];
    }
    else {
        sum = (components[0] + components[1] + components[2]) / 3.0f;
    }
    
    return (sum > 0.8f);
}

@end