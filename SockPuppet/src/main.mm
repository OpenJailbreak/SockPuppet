// <3 nedwill 2019
#import "AppDelegate.h"
#import <UIKit/UIKit.h>

extern "C" {
#include "iosurface.h"
#include "parameters.h"
#include "kernel_memory.h"
}

#include "exploit.h"

int main(int argc, char *argv[]) {
  IOSurface_init();

  if (!parameters_init()) {
    printf("failed to initialized parameters\n");
    return 0;
  }

  Exploit exploit;
  if (!exploit.GetKernelTaskPort()) {
    printf("Exploit failed\n");
  } else {
    printf("Exploit succeeded\n");
  }

  IOSurface_deinit();

  @autoreleasepool {
    return UIApplicationMain(argc, argv, nil,
                             NSStringFromClass([AppDelegate class]));
  }
}
