package com.example.grocery_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val sessionManager = SessionManager(this)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,SessionManager.CHANNEL )
                .setMethodCallHandler { call, result ->
                    when(call.method){
                        SessionManager.LOGIN_METHOD->{
                            val email = call.arguments<String>()
                            sessionManager.login(email)
                            result.success(true)
                        }
                        SessionManager.LOGOUT_METHOD->{
                            sessionManager.logout()
                            result.success(true)
                        }
                        SessionManager.USER_METHOD->{
                            val user = sessionManager.user
                            result.success(user)
                        }
                        else-> result.notImplemented()
                    }
                }
    }
}
