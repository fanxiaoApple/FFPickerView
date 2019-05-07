//
//  FFViewController.m
//  FFPickerView
//
//  Created by fanxiaoApple on 04/30/2019.
//  Copyright (c) 2019 fanxiaoApple. All rights reserved.
//  https://github.com/Abnerzj/ZJPickerView

#import "FFViewController.h"
#import "FFPickerView.h"

@interface FFViewController ()

@end

@implementation FFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}
- (IBAction)singleComp:(id)sender {
    NSArray *stringDataList = @[@"IT", @"销售", @"自媒体", @"游戏主播", @"产品策划"];
    [self showWithData:stringDataList];
}
- (IBAction)mutipleComDic:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityData" ofType:@"plist"];
    NSDictionary *cityNamesDict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSMutableArray *dictDataList = [NSMutableArray arrayWithCapacity:cityNamesDict.allKeys.count];
    [cityNamesDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [dictDataList addObject:@{key : obj}];
    }];
    [self showWithData:dictDataList];
}
- (IBAction)mutipleComArr:(id)sender {
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"CityData2" ofType:@"plist"];
    NSArray *arrayDataList = [NSArray arrayWithContentsOfFile:path2];
    [self showWithData:arrayDataList];
}
- (IBAction)complexComp:(id)sender {
    NSArray *cityArray = [self getCityData];
    [self showWithData:cityArray];
}
-(void)showWithData:(NSArray *)arrayDataList{
    
    [FFPickerView ff_showWithDataList:arrayDataList propertyDict:[self customPropertyDict] completion:^(NSString * _Nullable selectContent) {
        NSLog(@"%@",selectContent);
    }];
}
- (NSDictionary *)customPropertyDict {
    NSDictionary *propertyDict = @{FFPickerViewPropertyCanceBtnTitleKey : @"取消",
                                   FFPickerViewPropertyCanceBtnTitleKey : @"取消",
                                   FFPickerViewPropertySureBtnTitleKey  : @"确定",
                                   FFPickerViewPropertyCanceBtnTitleColorKey : [UIColor lightGrayColor],
                                   FFPickerViewPropertySureBtnTitleColorKey : [UIColor greenColor],
                                   FFPickerViewPropertyTipLabelTextColorKey : [UIColor darkGrayColor],
                                   FFPickerViewPropertyLineViewBackgroundColorKey : [UIColor darkGrayColor],
                                   FFPickerViewPropertyCanceBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   FFPickerViewPropertySureBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   FFPickerViewPropertyTipLabelTextFontKey : [UIFont systemFontOfSize:17.0f],
                                   FFPickerViewPropertyPickerViewHeightKey : @300.0f,
                                   FFPickerViewPropertyOneComponentRowHeightKey : @40.0f,
                                   FFPickerViewPropertySelectRowTitleAttrKey : @{NSForegroundColorAttributeName : [UIColor orangeColor], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   FFPickerViewPropertyUnSelectRowTitleAttrKey : @{NSForegroundColorAttributeName : [UIColor darkGrayColor], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   FFPickerViewPropertySelectRowLineBackgroundColorKey : [UIColor orangeColor],
                                   FFPickerViewPropertyIsTouchBackgroundHideKey : @YES,
                                   FFPickerViewPropertyIsShowTipLabelKey : @YES,
                                   FFPickerViewPropertyIsShowSelectContentKey : @YES,
                                   FFPickerViewPropertyIsScrollToSelectedRowKey: @YES,
                                   FFPickerViewPropertyIsAnimationShowKey : @YES};
    return propertyDict;
}
- (NSMutableArray *)getCityData
{
    NSMutableArray *areaDataArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CityData3" ofType:@"json"];
    NSString *areaString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    if (areaString && ![areaString isEqualToString:@""]) {
        NSError *error = nil;
        NSArray *areaStringArray = [NSJSONSerialization JSONObjectWithData:[areaString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        if (areaStringArray && areaStringArray.count) {
            [areaStringArray enumerateObjectsUsingBlock:^(NSDictionary *currentProviceDict, NSUInteger idx, BOOL * _Nonnull stop) {
                NSMutableDictionary *proviceDict = [NSMutableDictionary dictionary];
                NSString *proviceName = currentProviceDict[@"name"];
                NSArray *cityArray = currentProviceDict[@"childs"];
                
                NSMutableArray *tempCityArray = [NSMutableArray arrayWithCapacity:cityArray.count];
                [cityArray enumerateObjectsUsingBlock:^(NSDictionary *currentCityDict, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSMutableDictionary *cityDict = [NSMutableDictionary dictionary];
                    NSString *cityName = currentCityDict[@"name"];
                    NSArray *countryArray = currentCityDict[@"childs"];
                    
                    NSMutableArray *tempCountryArray = [NSMutableArray arrayWithCapacity:countryArray.count];
                    if (countryArray) {
                        [countryArray enumerateObjectsUsingBlock:^(NSDictionary *currentCountryDict, NSUInteger idx, BOOL * _Nonnull stop) {
                            [tempCountryArray addObject:currentCountryDict[@"name"]];
                        }];
                        
                        if (cityName) {
                            [cityDict setObject:tempCountryArray forKey:cityName];
                            [tempCityArray addObject:cityDict];
                        }
                    } else {
                        [tempCityArray addObject:cityName];
                    }
                }];
                
                if (proviceName && cityArray) {
                    [proviceDict setObject:tempCityArray forKey:proviceName];
                    [areaDataArray addObject:proviceDict];
                }
            }];
        } else {
            NSLog(@"解析错误");
        }
    }
    return areaDataArray;
}
@end
