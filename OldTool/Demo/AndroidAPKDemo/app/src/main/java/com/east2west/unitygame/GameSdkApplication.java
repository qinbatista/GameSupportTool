package com.east2west.unitygame;


import android.app.Application;
import android.util.Log;

import com.east2west.game.SdkApplication;


public class GameSdkApplication extends Application {
 
	@Override
	public void onCreate() {
		super.onCreate();


		Log.e("E2W","1->Applcation [change application->UnicomApplicationWrapper]");
		SdkApplication sdkapp= new SdkApplication();
		sdkapp.APPApplicationInit(this);
	}
	
}
