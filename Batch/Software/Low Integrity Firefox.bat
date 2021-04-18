icacls "C:\Program Files (x86)\Mozilla Firefox\Firefox.exe" /setintegritylevel low
icacls "C:\Users\<yourAccName>\AppData\Local\Temp" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<yourAccName>\AppData\Local\Mozilla" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<yourAccName>\AppData\Roaming\Mozilla" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<yourAccName>\Downloads" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<nextAccName>\AppData\Local\Temp" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<nextAccName>\AppData\Local\Mozilla" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<nextAccName>\AppData\Roaming\Mozilla" /setintegritylevel(oi)(ci) low /t
icacls "C:\Users\<nextAccName>\Downloads" /setintegritylevel(oi)(ci) low /t