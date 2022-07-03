package com.AmanitaDesign.testapp;


import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.AmanitaDesign.Machinarium.E2W.R;

public class MainActivity extends Activity  {
	public static Context context;


	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		context=this;
		Log.e("E2W","2->e2w");

		setContentView(R.layout.activity_main);
		Button btn = (Button) findViewById(R.id.pay);
		// button buy
		btn.setOnClickListener(new android.view.View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Log.e("E2W","7.1->purchaseProduct");

			}
		});

		// ****************************************exit
		Button exit = (Button) findViewById(R.id.exit);
		exit.setOnClickListener(new android.view.View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Log.e("E2W","7.2->ExitGame");
			}
		});

		Button btn1 = (Button) findViewById(R.id.button1);
		btn1.setOnClickListener(new android.view.View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Log.e("E2W","8.1->Function1");
			}
		});	
		Button btn2 = (Button) findViewById(R.id.button2);
		btn2.setOnClickListener(new android.view.View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Log.e("E2W","8.2->Function2");
			}
		});
		Button btn3 = (Button) findViewById(R.id.button3);
		btn3.setOnClickListener(new android.view.View.OnClickListener() {
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				Log.e("E2W","8.2->Function3");
			}
		});
//		Button btn4 = (Button) findViewById(R.id.button4);
//		btn4.setOnClickListener(new android.view.View.OnClickListener() {
//			@Override
//			public void onClick(View v) {
//				Log.e("E2W","8.2->show_push");
//				e2w.show_out();
//			}
//		});
//		Button btn5 = (Button) findViewById(R.id.Button5);
//		btn3.setOnClickListener(new android.view.View.OnClickListener() {
//			@Override
//			public void onClick(View v) {
//				// TODO Auto-generated method stub
//				Log.e("E2W","8.2->show_video");
//				e2w.show_video();
//			}
//		});
//		Button btn6 = (Button) findViewById(R.id.Button6);
//		btn4.setOnClickListener(new android.view.View.OnClickListener() {
//			@Override
//			public void onClick(View v) {
//
//			}
//		});
	}
	
	@Override
	public void onPause() 
	{
		super.onPause();

	}

	@Override
	public void onStop() 
	{
		super.onStop();

	}

	@Override
	public void onRestart() 
	{
		super.onRestart();

	}
	@Override
	public void onResume() 
	{
		super.onResume();

	}
	@Override
	public void onDestroy() 
	{
		super.onDestroy();

	}
	
}
