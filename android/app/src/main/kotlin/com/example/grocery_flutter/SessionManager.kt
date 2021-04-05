package com.example.grocery_flutter

import android.content.Context
import android.content.SharedPreferences

class SessionManager(context: Context) {
    val prefs = context.getSharedPreferences("appPreferences", Context.MODE_PRIVATE)
    fun login(email:String){
        prefs.edit().putString(USER_KEY,email).apply()
    }
    fun logout(){
        prefs.edit().remove(USER_KEY).apply()
    }
    val user:String?
    get() = prefs.getString(USER_KEY,null)
    companion object{
        const val USER_KEY = "USER"
        const val CHANNEL = "com.example.grocery_flutter.shared_preferences"
        const val LOGIN_METHOD = "login"
        const val USER_METHOD = "getUser"
        const val LOGOUT_METHOD = "logout"
        const val LOGIN_CHANNEL = "$CHANNEL.login"
        const val USER_CHANNEL = "$CHANNEL.user"
    }
}