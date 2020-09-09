// IExtendedNetworkService.aidl
package com.android.internal.telephony;

// Declare any non-default types here with import statements

interface IExtendedNetworkService {
     void setMmiString(String number);

    CharSequence getMmiRunningText();

    CharSequence getUserMessage(CharSequence text);

    void clearMmiString();
}
