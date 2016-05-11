//
//  FZDebug.h
//  suishouji
//
//  Created by 张帆 on 16/5/11.
//  Copyright © 2016年 fanstudio. All rights reserved.
//

#ifndef FZDebug_h
#define FZDebug_h

#ifdef __OBJC__

// 日志宏
#ifdef DEBUG
#define FZLOG(...) NSLog(__VA_ARGS__);
#define FZTrace NSLog(@"enter %s", __func__)
#define FZDebugNSData(data) OALOG(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding])
#else
#define FZLOG(...)
#define FZTrace
#define FZDebugNSData
#endif

//内存管理宏
#define WEAK_REF(obj_ref, obj) __weak typeof(obj) obj_ref = obj

#endif

#endif /* FZDebug_h */
