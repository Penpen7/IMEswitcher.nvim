package main

/*
#cgo LDFLAGS: -framework Carbon -framework Foundation
#cgo CFLAGS: -x objective-c
#include<Carbon/Carbon.h>
#include<Foundation/Foundation.h>
int switchToInputSource(char const *name) {
  NSString *inputSourceID = [NSString stringWithUTF8String:name];
  NSDictionary *properties =
      [NSDictionary dictionaryWithObject:inputSourceID
                                  forKey:(NSString *)kTISPropertyInputSourceID];
  NSArray *inputSources =
      [(NSArray *)TISCreateInputSourceList((CFDictionaryRef)properties, true)
          autorelease];
  if ([inputSources count] == 0) {
    return 1;
  }
  TISInputSourceRef inputSource =
      (TISInputSourceRef)[inputSources objectAtIndex:0];
  TISSelectInputSource(inputSource);
  return 0;
}*/
import "C"
import "github.com/neovim/go-client/nvim/plugin"

func IMESwitch(args []string) error {
	return nil
}

func main() {
	plugin.Main(func(p *plugin.Plugin) error {
		p.HandleFunction(&plugin.FunctionOptions{Name: "IMESwitch"}, IMESwitch)
		return nil
	})
}
