package com.east2west.unitygame;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.DialogInterface.OnClickListener;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Log;
import android.widget.Toast;

import com.east2west.game.E2WApp;
import com.east2west.game.QinConst;
import com.east2west.game.SdkApplication;
import com.east2west.game.inApp.APPBaseInterface;
import com.unity3d.player.UnityPlayer;
import com.unity3d.player.UnityPlayerActivity;

public class MainActivity extends UnityPlayerActivity {
	public static MainActivity mContext = null;
	public static Context context;
	public E2WApp e2w;
	public static APPBaseInterface appcall=null;
	public static String productId;//传过来的strProductId
	public static String adId;//传过来的adId
	public static String callBackObjectName = "DontDestroy_Qin"; //default=DontDestroy_Qin
	
	@Override
	protected void onCreate(Bundle savedInstanceState) 
	{
		super.onCreate(savedInstanceState);
		
		mContext=this;
		context=this;
		e2w=new E2WApp();
		appcall = new  APPBaseInterface() {
			
			@Override
			public void onPurchaseSuccessCallBack(String strProductId) {
				// TODO Auto-generated method stub
				Log.e("game", "onCreate onPurchaseSuccessCallBack strProductId="+productId);	
				//Toast.makeText(context, "获得道具成功",Toast.LENGTH_SHORT).show();
				//unity DontDestroy_Qin BuySuccess strProductId
				UnityPlayer.UnitySendMessage(callBackObjectName, "BuySuccess",productId);
			}
			
			@Override
			public void onPurchaseFailedCallBack(String strProductId) {
				// TODO Auto-generated method stub
				Log.e("game", "onCreate onPurchaseFailedCallBack strProductId="+strProductId);					
			}
			
			@Override
			public void onPurchaseCancelCallBack(String strProductId) {
				// TODO Auto-generated method stub
				Log.e("game", "onCreate onPurchaseCancelCallBack strProductId="+strProductId);					
			}

			@Override
			public void onLoginCancelCallBack(String arg0) {
				// TODO Auto-generated method stub
				Log.e("game", "onCreate onLoginCancelCallBack arg0="+arg0+",callBackObjectName="+callBackObjectName);
				UnityPlayer.UnitySendMessage(callBackObjectName, "LoginCancel",arg0);
				
			}

			@Override
			public void onLoginFailedCallBack(String arg0) {
				// TODO Auto-generated method stub
				Log.e("game", "onCreate onLoginFailedCallBack arg0="+arg0);		
				UnityPlayer.UnitySendMessage(callBackObjectName, "LoginFailed",arg0);
			}

			@Override
			public void onLoginSuccessCallBack(String arg0) {
				// TODO Auto-generated method stub
				Log.e("game", "onCreate onLoginSuccessCallBack arg0="+arg0);	
				UnityPlayer.UnitySendMessage(callBackObjectName, "LoginSuccess",arg0);
			}
			@Override
			public void onLoadSuccessfulCallBack(String s) {
				Log.e("game", "onCreate onLoadSuccessfulCallBack arg0="+s);
			}

			@Override
			public void onLoadFailedCallBack(String s) {
				Log.e("game", "onCreate onLoadFailedCallBack arg0="+s);
			}

			@Override
			public void onSaveSuccessfulCallBack(String s) {
				Log.e("game", "onCreate onSaveSuccessfulCallBack arg0="+s);
			}

			@Override
			public void onSaveFailedCallBack(String s) {
				Log.e("game", "onCreate onSaveFailedCallBack arg0="+s);
			}

			@Override
			public void onOnVideoCompletedCallBack(String s) {
				Log.e("game", "onCreate onOnVideoCompletedCallBack arg0="+s);
			}

			@Override
			public void onOnVideoFailedCallBack(String s) {
				Log.e("game", "onCreate onOnVideoFailedCallBack arg0="+s);
			}

			@Override
			public void onFunctionCallBack(String arg0) {
				// TODO Auto-generated method stub
				if(arg0.equals("ad")&&!adId.equals("")) {
					UnityPlayer.UnitySendMessage(callBackObjectName, "BuySuccess",adId);
					adId = "";
					return;
				}
				Log.e("game", "onCreate onFunctionCallBack arg0="+arg0);	
				UnityPlayer.UnitySendMessage(callBackObjectName, "ExchangeSuccess",arg0);
			}
		};
		Log.e("E2W","4->InitE2WSDK");
		e2w.InitE2WSDK (context);
		Log.e("E2W","5->InitCarriers");
		e2w.InitCarriers(appcall);
		Log.e("E2W","6->Channel");
		e2w.InitChannel(appcall);
		Log.e("E2W","7->InitAd");
		e2w.InitAd(appcall);
	}

    //设置游戏MD5
    public void FunctionS(String number) 
   	{   	
		
   	}
    //设置运营商key
    public void FunctionK(String number) 
   	{
    	
   	}
	//把APP渠道名字Unity
    public void FunctionC(String number)
	{	
		
	}
	//把货取联网log
    public void FunctionL(String number)
	{
		
	}
	void InitCarriers(final String strAppId, final String strAppKey) 
	{		
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  
					  }
				});
			}
		});
	}
	void InitChannel(final String strAppId, final String strAppKey) 
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() { 
						  Log.e("game", "InitChannel ID="+strAppId);	
						  
					  }
				});
			}
		});
	}
	
	/*void IfHasLoginPanel() {
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() { 
						  //Log.e("game", "IfHasLoginPanel ID="+e2w.GetChannelSortID()+"----callBackObjectName="+callBackObjectName);	
						  if(e2w.GetChannelSortID()!=null&&e2w.GetChannelSortID().contains("ysdk")) {
						  //if(true) {
							  UnityPlayer.UnitySendMessage(callBackObjectName, "GetLoginPanel",e2w.GetChannelSortID());
						  }
						  
					  }
				});
			}
		});
	}*/
	
	void InitCallBackObjectName(String name) {
		callBackObjectName = name;
	}
	
	void GetSDKInfo() {
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() { 
						  Log.e("game", "GetSDKInfo");
						  String ADs = "1110";//千位是insert,百位是banner,十位是show_push,个位是video
						  //获取广告
						  if(QinConst.ADChannel!=null&&QinConst.ADChannel.contains("jrtt")) {
							  ADs = "1111";
						  }
						  //获取渠道信息
						  if(e2w.GetChannelSortID()!=null){
						  //if(true){
							  //UnityPlayer.UnitySendMessage(callBackObjectName, "SetSDKInfo",e2w.GetChannelSortID());
							  Log.e("game", "SetSDKInfo=>"+"ysdk"+","+ADs);
							  UnityPlayer.UnitySendMessage(callBackObjectName, "SetSDKInfo",e2w.GetChannelSortID()+","+ADs);
						  }
						  //获取登陆窗口
						  if(e2w.GetChannelSortID()!=null&&e2w.GetChannelSortID().contains("ysdk")) {
						  //if(true) {
							  UnityPlayer.UnitySendMessage(callBackObjectName, "GetLoginPanel","");
						  }
					  }
				});
			}
		});
	}
	
	void InitAd(final String platform)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  	
					  }
				});
			}
		});
	}
	void show_insert(final String Scene)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","show_insert");
						  	e2w.show_insert(Scene);
					  }
				});
			}
		});
	}
	
	void show_banner(final String Scene)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","show_banner");
						  e2w.show_banner(Scene);
					  }
				});
			}
		});
	}
	
	void show_push(final String Scene)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","show_push");
						  e2w.show_push(Scene);
					  }
				});
			}
		});
	}
	
	void show_out(final String Scene)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","show_out");
						  e2w.show_out(Scene);
					  }
				});
			}
		});
	}
	
	void show_video(final String Scene)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","show_video");
						  e2w.show_video(Scene);
					  }
				});
			}
		});
	}

	void purchaseProduct(final String strProductId, final String strProductDescription, final float fPrice , final boolean isChannelPid) 
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  purchaseProduct(strProductId);
					  }
				});
			}
		});
	}
	void purchaseProduct(final String strProductId) 
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  	productId = strProductId;
						  	Log.e("game", "purchaseProduct=="+strProductId);
						  	e2w.purchaseProduct(strProductId);
					  }
				});
			}
		});
	}
	@Override
	public void onPause() 
	{
		super.onPause();
		e2w.onPause();
	}

	@Override
	public void onStop() 
	{
		super.onStop();
		e2w.onStop();
	}

	@Override
	public void onRestart() 
	{
		super.onRestart();
		e2w.onRestart();
	}
	@Override
	public void onResume() 
	{
		super.onResume();
		e2w.onResume();
	}
	@Override
	public void onDestroy() 
	{
		super.onDestroy();
		e2w.onDestroy();
	}


	public static Object getInstance() {	
		Log.e("game","getInstance="+mContext);
		return mContext;
	}
	
	
	
	public void getMacAddress() {
        // 获取mac地址：
		TelephonyManager tm = (TelephonyManager) this.getSystemService(TELEPHONY_SERVICE);     
		String Imei = tm.getDeviceId();      
        UnityPlayer.UnitySendMessage("DontDestroy_Qin", "SetMac", Imei);
    }
	public void Exchange()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","Exchange");
						  e2w.Exchange();
						}
				});
			}
		});
	}
	
	void ExitGame()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("E2W","7.2->ExitGame");
						  Log.e("game","Exit");
						  e2w.ExitGame();
						}
				});
			}
		});
	}
	
	void Cloud()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","Cloud");
						}
				});
			}
		});
	}

	void Repay()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","Repay");
						  Log.e("E2W","8.1->repairindentRequest");
						  e2w.repairindentRequest();
						}
				});
			}
		});
	}
	void Pay()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  Log.e("game","Pay");
						  Log.e("E2W","7.1->purchaseProduct");
						  //e2w.purchaseProduct("UnlockGame");
						}
				});
			}
		});
	}
	void Message(final String news)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  e2w.Message(news);
					  }
				});
			}
		});
	}

	void SharePicture(final String imagePath,final boolean istimeline)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  e2w.SharePicture(imagePath, istimeline, appcall);
						}
				});
			}
		});
	}	
	public void letUserLogin() 
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  
						}
				});
			}
		});
	}
	public void stopWaiting() 
	{
		// TODO Auto-generated method stub
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {

						}
				});
			}
		});
		
	}
	public void letUserLogout() 
	{
		// TODO Auto-generated method stub
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {

						}
				});
			}
		});

	}
	public void showDiffLogin() 
	{
		// TODO Auto-generated method stub
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{	
				mContext.runOnUiThread(new Runnable() {
					  public void run() {

						}
				});
			}
		});
	}
	void TencentLogin(final int kind)
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {
						  e2w.TencentLogin(kind);
						}
				});
			}
		});
	}
	void TencentLoginOut()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {

						}
				});
			}
		});
	}
	void showMessageDialog()
	{
		UnityPlayer.currentActivity.runOnUiThread(new Runnable() 
		{
			@Override
			public void run() 
			{
				mContext.runOnUiThread(new Runnable() {
					  public void run() {

						}
				});
			}
		});
	}
	
    @Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		super.onActivityResult(requestCode, resultCode, data);

	}
	@Override
	protected void onNewIntent(Intent intent) {
		// TODO Auto-generated method stub
		super.onNewIntent(intent);

	}
	

}
