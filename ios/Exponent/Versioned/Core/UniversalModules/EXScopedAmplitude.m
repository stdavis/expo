// Copyright © 2019-present 650 Industries. All rights reserved.

#if __has_include(<EXAmplitude/EXAmplitude.h>)
#import "EXScopedAmplitude.h"
#import <Amplitude/Amplitude.h>

@interface EXAmplitude (Protected)

- (Amplitude *)amplitudeInstance;

@end

@interface EXScopedAmplitude ()

@property (strong, nonatomic) NSString *escapedExperienceStableLegacyId;

@end

@implementation EXScopedAmplitude

- (instancetype)initWithExperienceStableLegacyId:(NSString *)experienceStableLegacyId
{
  if (self = [super init]) {
    _escapedExperienceStableLegacyId = [self escapedExperienceStableLegacyId:experienceStableLegacyId];
  }
  return self;
}

- (Amplitude *)amplitudeInstance
{
  return [Amplitude instanceWithName:_escapedExperienceStableLegacyId];
}

- (NSString *)escapedExperienceStableLegacyId:(NSString *)experienceStableLegacyId
{
  NSString *charactersToEscape = @"!*'();:@&=+$,/?%#[]";
  NSCharacterSet *allowedCharacters = [[NSCharacterSet characterSetWithCharactersInString:charactersToEscape] invertedSet];
  return [experienceStableLegacyId stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacters];
}

@end
#endif
