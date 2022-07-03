package com.east2west.unitygame;

import android.app.Application;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.util.Log;
import com.east2west.game.SdkApplication;
public class GameSdkApplication extends Application 
{

	@Override
	public void onCreate() 
	{
		Log.e("E2W","1->Applcation [change application->UnicomApplicationWrapper]");
		super.onCreate();
		SdkApplication sdkapp= new SdkApplication();
		sdkapp.APPApplicationInit(this);

	}
	

}
