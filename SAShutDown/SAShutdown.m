/*
 # SAShutdown - Simple class to shutdown/reboot/logout the system
 # Copyright (C) 2009-2012 Shmoopi LLC <shmoopillc@gmail.com> <http://www.shmoopi.net/>
 #
 # BSD License
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #     * Redistributions of source code must retain the above copyright
 #       notice, this list of conditions and the following disclaimer.
 #     * Redistributions in binary form must reproduce the above copyright
 #       notice, this list of conditions and the following disclaimer in the
 #       documentation and/or other materials provided with the distribution.
 #     * Neither the name of Shmoopi LLC nor that of any other
 #       contributors may be used to endorse or promote products
 #       derived from this software without specific prior written permission.
 #
 # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 # ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 # WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 # DISCLAIMED. IN NO EVENT SHALL  BE LIABLE FOR ANY
 # DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 # (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 # LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 # ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "SAShutdown.h"
#import <Carbon/Carbon.h>

@implementation SAShutdown

// Shutdown
- (OSStatus)Shutdown {
    // Set up the variables
    AEAddressDesc targetDesc;
    static const ProcessSerialNumber kSystemProcessPSN = { 0, kSystemProcess };
    AppleEvent eventReply = {typeNull, NULL};
    AppleEvent AEToSend = {typeNull, NULL};
    // Set up the status
    OSStatus error = noErr;
    // Creates a new descriptor
    error = AECreateDesc(typeProcessSerialNumber, &kSystemProcessPSN, sizeof(kSystemProcessPSN), &targetDesc);
    // Check for errors
    if (error != noErr)
        // Return an error
        return error;
    // Creates an Apple Event to send to the system to shutdown
    error = AECreateAppleEvent(kCoreEventClass, kAEShutDown, &targetDesc, kAutoGenerateReturnID, kAnyTransactionID, &AEToSend);
    // Get rid of the descriptor
    AEDisposeDesc(&targetDesc);
    // Check for errors again
    if (error != noErr)
        // Return an error
        return error;
    // Send the Apple Event to the system
    error = AESend(&AEToSend, &eventReply, kAENoReply, kAENormalPriority, kAEDefaultTimeout, NULL, NULL);
    // Get rid of the send descriptor
    AEDisposeDesc(&AEToSend);
    // Check for errors
    if (error != noErr)
        // Return an error
        return error;
    // Get rid of the last descriptor
    AEDisposeDesc(&eventReply);
    // Return all good
    return noErr;
}

// Reboot
- (OSStatus)Reboot {
    // Set up the variables
    AEAddressDesc targetDesc;
    static const ProcessSerialNumber kSystemProcessPSN = { 0, kSystemProcess };
    AppleEvent eventReply = {typeNull, NULL};
    AppleEvent AEToSend = {typeNull, NULL};
    // Set up the status
    OSStatus error = noErr;
    // Creates a new descriptor
    error = AECreateDesc(typeProcessSerialNumber, &kSystemProcessPSN, sizeof(kSystemProcessPSN), &targetDesc);
    // Check for errors
    if (error != noErr)
        // Return an error
        return error;
    // Creates an Apple Event to send to the system to shutdown
    error = AECreateAppleEvent(kCoreEventClass, kAERestart, &targetDesc, kAutoGenerateReturnID, kAnyTransactionID, &AEToSend);
    // Get rid of the descriptor
    AEDisposeDesc(&targetDesc);
    // Check for errors again
    if (error != noErr)
        // Return an error
        return error;
    // Send the Apple Event to the system
    error = AESend(&AEToSend, &eventReply, kAENoReply, kAENormalPriority, kAEDefaultTimeout, NULL, NULL);
    // Get rid of the send descriptor
    AEDisposeDesc(&AEToSend);
    // Check for errors
    if (error != noErr)
        // Return an error
        return error;
    // Get rid of the last descriptor
    AEDisposeDesc(&eventReply);
    // Return all good
    return noErr;
}

// Logout
- (OSStatus)Logout {
    // Set up the variables
    AEAddressDesc targetDesc;
    static const ProcessSerialNumber kSystemProcessPSN = { 0, kSystemProcess };
    AppleEvent eventReply = {typeNull, NULL};
    AppleEvent AEToSend = {typeNull, NULL};
    // Set up the status
    OSStatus error = noErr;
    // Creates a new descriptor
    error = AECreateDesc(typeProcessSerialNumber, &kSystemProcessPSN, sizeof(kSystemProcessPSN), &targetDesc);
    // Check for errors
    if (error != noErr)
        // Return an error
        return error;
    // Creates an Apple Event to send to the system to shutdown
    error = AECreateAppleEvent(kCoreEventClass, kAELogOut, &targetDesc, kAutoGenerateReturnID, kAnyTransactionID, &AEToSend);
    // Get rid of the descriptor
    AEDisposeDesc(&targetDesc);
    // Check for errors again
    if (error != noErr)
        // Return an error
        return error;
    // Send the Apple Event to the system
    error = AESend(&AEToSend, &eventReply, kAENoReply, kAENormalPriority, kAEDefaultTimeout, NULL, NULL);
    // Get rid of the send descriptor
    AEDisposeDesc(&AEToSend);
    // Check for errors
    if (error != noErr)
        // Return an error
        return error;
    // Get rid of the last descriptor
    AEDisposeDesc(&eventReply);
    // Return all good
    return noErr;
}

@end
