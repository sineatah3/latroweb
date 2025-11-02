.class public abstract synthetic Lorg/libsdl/app/f0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static bridge synthetic a(Landroid/hardware/usb/UsbDeviceConnection;IIII[BIII)I
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Landroid/hardware/usb/UsbDeviceConnection;->controlTransfer(IIII[BIII)I

    move-result p0

    return p0
.end method
