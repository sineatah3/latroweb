.class public abstract synthetic Lorg/libsdl/app/v;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static bridge synthetic a(Landroid/bluetooth/BluetoothGattCharacteristic;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result p0

    return p0
.end method
