//
//  UIColor+VDKit.h
//  VDKit
//
//  Created by FTET on 15/1/28.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>


#ifndef VDRGBColor
#define VDRGBColor(r, g, b) \
[UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1.0f]
#endif

#ifndef VDRGBAColor
#define VDRGBAColor(r, g, b, a) \
[UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b)/ 255.0f alpha:(a) ]
#endif

#ifndef VDColorFromRGB
#define VDColorFromRGB(rgbValue) \
[UIColor colorWithRed:( (float)( (rgbValue & 0xFF0000) >> 16) ) / 255.0f green:( (float)( (rgbValue & 0xFF00) >> 8) ) / 255.0f blue:( (float)(rgbValue & 0xFF) ) / 255.0f alpha:1.0f]
#endif

#ifndef VDColorFromRGBA
#define VDColorFromRGBA(rgbaValue) \
[UIColor colorWithRed:( (float)( (rgbaValue & 0xFF000000) >> 24) ) / 255.0f green:( (float)( (rgbaValue & 0xFF0000) >> 16) ) / 255.0f blue:( (float)( (rgbaValue & 0xFF00) >> 8) ) / 255.0f alpha:( (float)(rgbaValue & 0xFF) ) / 255.0f]
#endif

#pragma VDColor

#define VDC_WHITE 0xFFFFFF // 白色

#define VDC_IVORY 0xFFFFF0 // 象牙色

#define VDC_LIGHT_YELLOW 0xFFFFE0 // 亮黄色

#define VDC_YELLOW 0xFFFF00 // 黄色

#define VDC_SNOW 0xFFFAFA // 雪白色

#define VDC_FLORAL_WHITE 0xFFFAF0 // 花白色

#define VDC_LEMON_CHIFFON 0xFFFACD // 柠檬绸色

#define VDC_CORN_SILK 0xFFF8DC // 米绸色

#define VDC_SEA_SHELL 0xFFF5EE // 海贝色

#define VDC_LAVENDER_BLUSH 0xFFF0F5 // 淡紫红

#define VDC_PAPAYA_WHIP 0xFFEFD5 // 番木色

#define VDC_BLANCHED_ALMOND 0xFFEBCD // 白杏色

#define VDC_MISTY_ROSE 0xFFE4E1 // 浅玫瑰色

#define VDC_BISQUE 0xFFE4C4 // 桔黄色

#define VDC_MOCCASIN 0xFFE4B5 // 鹿皮色

#define VDC_NAVAJO_WHITE 0xFFDEAD // 纳瓦白

#define VDC_PEACHPUFF 0xFFDAB9 // 桃色

#define VDC_GOLD 0xFFD700 // 金色

#define VDC_PINK 0xFFC0CB // 粉红色

#define VDC_LIGHT_PINK 0xFFB6C1 // 亮粉红色

#define VDC_ORANGE 0xFFA500 // 橙色

#define VDC_LIGHT_SALMON 0xFFA07A // 亮肉色

#define VDC_DARK_ORANGE 0xFF8C00 // 暗桔黄色

#define VDC_CORAL 0xFF7F50 // 珊瑚色

#define VDC_HOT_PINK 0xFF69B4 // 热粉红色

#define VDC_TOMATO 0xFF6347 // 西红柿色

#define VDC_ORANGE_RED 0xFF4500 // 红橙色

#define VDC_DEEP_PINK 0xFF1493 // 深粉红色

#define VDC_FUCHSIA 0xFF00FF // 紫红色

#define VDC_MAGENTA 0xFF00FF // 红紫色

#define VDC_RED 0xFF0000 // 红色

#define VDC_OLDLACE 0xFDF5E6 // 老花色

#define VDC_LIGHT_GOLDENROD_YELLOW 0xFAFAD2 // 亮金黄色

#define VDC_LINEN 0xFAF0E6 // 亚麻色

#define VDC_ANTIQUE_WHITE 0xFAEBD7 // 古董白

#define VDC_SALMON 0xFA8072 // 鲜肉色

#define VDC_GHOST_WHITE 0xF8F8FF // 幽灵白

#define VDC_MINTCREAM 0xF5FFFA // 薄荷色

#define VDC_WHITE_SMOKE 0xF5F5F5 // 烟白色

#define VDC_BEIGE 0xF5F5DC // 米色

#define VDC_WHEAT 0xF5DEB3 // 浅黄色

#define VDC_SANDY_BROWN 0xF4A460 // 沙褐色

#define VDC_AZURE 0xF0FFFF // 天蓝色

#define VDC_HONEYDEW 0xF0FFF0 // 蜜色

#define VDC_ALICE_BLUE 0xF0F8FF // 艾利斯兰

#define VDC_KHAKI 0xF0E68C // 黄褐色

#define VDC_LIGHT_CORAL 0xF08080 // 亮珊瑚色

#define VDC_PALE_GOLDENROD 0xEEE8AA // 苍麒麟色

#define VDC_VIOLET 0xEE82EE // 紫罗兰色

#define VDC_DARK_SALMON 0xE9967A // 暗肉色

#define VDC_LAVENDER 0xE6E6FA // 淡紫色

#define VDC_LIGHT_CYAN 0xE0FFFF // 亮青色

#define VDC_BURLY_WOOD 0xDEB887 // 实木色

#define VDC_PLUM 0xDDA0DD // 洋李色

#define VDC_GAINSBORO 0xDCDCDC // 淡灰色

#define VDC_CRIMSON 0xDC143C // 暗深红色

#define VDC_PALE_VIOLETRED 0xDB7093 // 苍紫罗兰色

#define VDC_GOLDENROD 0xDAA520 // 金麒麟色

#define VDC_ORCHID 0xDA70D6 // 淡紫色

#define VDC_THISTLE 0xD8BFD8 // 蓟色

#define VDC_LIGHT_GRAY 0xD3D3D3 // 亮灰色

#define VDC_LIGHT_GREY 0xD3D3D3 // 亮灰色

#define VDC_TAN 0xD2B48C // 茶色

#define VDC_CHOCOLATE 0xD2691E // 巧可力色

#define VDC_PERU 0xCD853F // 秘鲁色

#define VDC_INDIAN_RED 0xCD5C5C // 印第安红

#define VDC_MEDIUM_VIOLETRED 0xC71585 // 中紫罗兰色

#define VDC_SILVER 0xC0C0C0 // 银色

#define VDC_DARK_KHAKI 0xBDB76B // 暗黄褐色

#define VDC_ROSY_BROWN 0xBC8F8F // 褐玫瑰红

#define VDC_MEDIUM_ORCHID 0xBA55D3 // 中粉紫色

#define VDC_DARK_GOLDENROD 0xB8860B // 暗金黄色

#define VDC_FIRE_BRICK 0xB22222 // 火砖色

#define VDC_POWDER_BLUE 0xB0E0E6 // 粉蓝色

#define VDC_LIGHT_STEEL_BLUE 0xB0C4DE // 亮钢兰色

#define VDC_PALE_TURQUOISE 0xAFEEEE // 苍宝石绿

#define VDC_GREEN_YELLOW 0xADFF2F // 黄绿色

#define VDC_LIGHT_BLUE 0xADD8E6 // 亮蓝色

#define VDC_DARK_GRAY 0xA9A9A9 // 暗灰色

#define VDC_DARK_GREY 0xA9A9A9 // 暗灰色

#define VDC_BROWN 0xA52A2A // 褐色

#define VDC_SIENNA 0xA0522D // 赭色

#define VDC_DARK_ORCHID 0x9932CC // 暗紫色

#define VDC_PALE_GREEN 0x98FB98 // 苍绿色

#define VDC_DARK_VIOLET 0x9400D3 // 暗紫罗兰色

#define VDC_MEDIUM_PURPLE 0x9370DB // 中紫色

#define VDC_LIGHT_GREEN 0x90EE90 // 亮绿色

#define VDC_DARK_SEA_GREEN 0x8FBC8F // 暗海兰色

#define VDC_SADDLE_BROWN 0x8B4513 // 重褐色

#define VDC_DARK_MAGENTA 0x8B008B // 暗洋红

#define VDC_DARK_RED 0x8B0000 // 暗红色

#define VDC_BLUE_VIOLET 0x8A2BE2 // 紫罗兰蓝色

#define VDC_LIGHT_SKYBLUE 0x87CEFA // 亮天蓝色

#define VDC_SKY_BLUE 0x87CEEB // 天蓝色

#define VDC_GRAY 0x808080 // 灰色

#define VDC_GREY 0x808080 // 灰色

#define VDC_OLIVE 0x808000 // 橄榄色

#define VDC_PURPLE 0x800080 // 紫色

#define VDC_MAROON 0x800000 // 粟色

#define VDC_AQUAMARINE 0x7FFFD4 // 碧绿色

#define VDC_CHARTREUSE 0x7FFF00 // 黄绿色

#define VDC_LAWN_GREEN 0x7CFC00 // 草绿色

#define VDC_MEDIUM_SLATE_BLUE 0x7B68EE // 中暗蓝色

#define VDC_LIGHT_SLATE_GRAY 0x778899 // 亮蓝灰

#define VDC_LIGHT_SLATE_GREY 0x778899 // 亮蓝灰

#define VDC_SLATE_GRAY 0x708090 // 灰石色

#define VDC_SLATE_GREY 0x708090 // 灰石色

#define VDC_OLIVE_DRAB 0x6B8E23 // 深绿褐色

#define VDC_SLATE_BLUE 0x6A5ACD // 石蓝色

#define VDC_DIM_GRAY 0x696969 // 暗灰色

#define VDC_DIM_GREY 0x696969 // 暗灰色

#define VDC_MEDIUM_AQUAMARINE 0x66CDAA // 中绿色

#define VDC_CORN_FLOWER_BLUE 0x6495ED // 菊兰色

#define VDC_CADET_BLUE 0x5F9EA0 // 军兰色

#define VDC_DARK_OLIVE_GREEN 0x556B2F // 暗橄榄绿

#define VDC_INDIGO 0x4B0082 // 靛青色

#define VDC_MEDIUM_TURQUOISE 0x48D1CC // 中绿宝石

#define VDC_DARK_SLATE_BLUE 0x483D8B // 暗灰蓝色

#define VDC_STEEL_BLUE 0x4682B4 // 钢兰色

#define VDC_ROYAL_BLUE 0x4169E1 // 皇家蓝

#define VDC_TURQUOISE 0x40E0D0 // 青绿色

#define VDC_MEDIUM_SEA_GREEN 0x3CB371 // 中海蓝

#define VDC_LIME_GREEN 0x32CD32 // 橙绿色

#define VDC_DARK_SLATE_GRAY 0x2F4F4F // 暗瓦灰色

#define VDC_DARK_SLATE_GREY 0x2F4F4F // 暗瓦灰色

#define VDC_SEA_GREEN 0x2E8B57 // 海绿色

#define VDC_FOREST_GREEN 0x228B22 // 森林绿

#define VDC_LIGHT_SEA_GREEN 0x20B2AA // 亮海蓝色

#define VDC_DODGER_BLUE 0x1E90FF // 闪兰色

#define VDC_TRANSLUCENT_DODGER_BLUE 0x1E90FF55 // 半透明闪兰色

#define VDC_MIDNIGHT_BLUE 0x191970 // 中灰兰色

#define VDC_AQUA 0x00FFFF // 浅绿色

#define VDC_CYAN 0x00FFFF // 青色

#define VDC_SPRING_GREEN 0x00FF7F // 春绿色

#define VDC_LIME 0x00FF00 // 酸橙色

#define VDC_MEDIUM_SPRING_GREEN 0x00FA9A // 中春绿色

#define VDC_DARK_TURQUOISE 0x00CED1 // 暗宝石绿

#define VDC_DEEP_SKY_BLUE 0x00BFFF // 深天蓝色

#define VDC_DARK_CYAN 0x008B8B // 暗青色

#define VDC_TEAL 0x008080 // 水鸭色

#define VDC_GREEN 0x008000 // 绿色

#define VDC_DARK_GREEN 0x006400 // 暗绿色

#define VDC_BLUE 0x0000FF // 蓝色

#define VDC_MEDIUM_BLUE 0x0000CD // 中兰色

#define VDC_DARK_BLUE 0x00008B // 暗蓝色

#define VDC_NAVY 0x000080 // 海军色

#define VDC_BLACK 0x000000 // 黑色

#define VDC_TRANSLUCENT_BLACK 0x000000AA // 透明黑色

#define VDC_TRANSLUCENT 0x00000000 // 透明

#define VDC_GENERAL_BLUE 0x2786fc // 平蓝

#define VDC_GRAY_GREEN 0x647d1e

#define VDC_BROWN_GRAY 0x424750

#define VDC_SHINE_CYAN 0x32eafa

#define VDC_BIT_GRAY 0xc1bebc


@interface UIColor (VDKit)

#pragma Methods
#pragma Public Class Method

#pragma Public Instance Method
+ (UIColor *)vd_hexColor:(NSString *)hexString;

@end
