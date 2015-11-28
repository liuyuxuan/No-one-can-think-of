//
//  YXTopicVoiceView.m
//  百思不得姐
//
//  Created by 刘雨轩 on 15/11/23.
//  Copyright © 2015年 刘雨轩. All rights reserved.
//

#import "YXTopicVoiceView.h"
#import "YXTopic.h"
#import <UIImageView+WebCache.h>
@interface YXTopicVoiceView()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *playCountLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end

@implementation YXTopicVoiceView

- (void)awakeFromNib
{
    self.autoresizingMask = UIViewAutoresizingNone;
}
- (void)setTopic:(YXTopic *)topic
{
    _topic = topic;
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:topic.large_image]];
    self.playCountLab.text = [NSString stringWithFormat:@"%zd",topic.playcount];
    self.timeLab.text = [NSString stringWithFormat:@"%02zd:%02zd",topic.voicetime / 60,topic.voicetime % 60];
}

- (IBAction)begin:(id)sender {
}


@end
