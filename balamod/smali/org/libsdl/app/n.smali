.class public abstract synthetic Lorg/libsdl/app/n;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static bridge synthetic a(Landroid/bluetooth/BluetoothManager;Landroid/bluetooth/BluetoothDevice;I)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/bluetooth/BluetoothManager;->getConnectionState(Landroid/bluetooth/BluetoothDevice;I)I

    move-result p0

    return p0
.end method
