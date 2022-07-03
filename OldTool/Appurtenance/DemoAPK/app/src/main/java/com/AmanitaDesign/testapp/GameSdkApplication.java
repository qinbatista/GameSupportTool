package com.AmanitaDesign.testapp;



import android.app.Application;
import android.content.Context;
import android.telephony.TelephonyManager;
import android.util.Log;
import android.widget.Toast;



public class GameSdkApplication extends Application { 
 
	@Override
	public void onCreate() {
		super.onCreate();


		Log.e("E2W","1->Applcation [change application->UnicomApplicationWrapper ��]");

	}
	
}
