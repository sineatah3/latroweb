.class public abstract synthetic Lorg/libsdl/app/t;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static bridge synthetic a(Landroid/bluetooth/BluetoothGatt;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    move-result p0

    return p0
.end method
