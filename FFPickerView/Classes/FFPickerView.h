//
//  FFPickerView.h
//  FFPickerView
//
//  Created by fanxiaoApple on 04/30/2019.
//  Copyright (c) 2019 fanxiaoApple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFPickerView : UIView

#pragma mark - Customization

// content: NSString type
extern NSString * _Nonnull const FFPickerViewPropertyCanceBtnTitleKey;
extern NSString * _Nonnull const FFPickerViewPropertySureBtnTitleKey;
extern NSString * _Nonnull const FFPickerViewPropertyTipLabelTextKey;

// color: UIColor type
extern NSString * _Nonnull const FFPickerViewPropertyCanceBtnTitleColorKey;
extern NSString * _Nonnull const FFPickerViewPropertySureBtnTitleColorKey;
extern NSString * _Nonnull const FFPickerViewPropertyTipLabelTextColorKey;
extern NSString * _Nonnull const FFPickerViewPropertyLineViewBackgroundColorKey;

// font: UIFont type
extern NSString * _Nonnull const FFPickerViewPropertyCanceBtnTitleFontKey;
extern NSString * _Nonnull const FFPickerViewPropertySureBtnTitleFontKey;
extern NSString * _Nonnull const FFPickerViewPropertyTipLabelTextFontKey;

// pickerView:
// CGFloat type
extern NSString * _Nonnull const FFPickerViewPropertyPickerViewHeightKey;
extern NSString * _Nonnull const FFPickerViewPropertyOneComponentRowHeightKey;
// NSDictionary type
extern NSString * _Nonnull const FFPickerViewPropertySelectRowTitleAttrKey;
extern NSString * _Nonnull const FFPickerViewPropertyUnSelectRowTitleAttrKey;
// UIColor type
extern NSString * _Nonnull const FFPickerViewPropertySelectRowLineBackgroundColorKey;

// other:
// BOOL type
extern NSString * _Nonnull const FFPickerViewPropertyIsTouchBackgroundHideKey;
extern NSString * _Nonnull const FFPickerViewPropertyIsShowTipLabelKey;
extern NSString * _Nonnull const FFPickerViewPropertyIsShowSelectContentKey;
extern NSString * _Nonnull const FFPickerViewPropertyIsScrollToSelectedRowKey;
extern NSString * _Nonnull const FFPickerViewPropertyIsAnimationShowKey;
// CGFloat type
extern NSString * _Nonnull const FFPickerViewPropertyBackgroundAlphaKey;


+ (void)ff_showWithDataList:(nonnull NSArray *)dataList
               propertyDict:(nullable NSDictionary *)propertyDict
                 completion:(nullable void(^)(NSString * _Nullable selectContent))completion;
@end
