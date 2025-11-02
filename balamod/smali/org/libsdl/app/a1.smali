.class public abstract synthetic Lorg/libsdl/app/a1;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static bridge synthetic a(Landroid/media/AudioRecord;[BIII)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/media/AudioRecord;->read([BIII)I

    move-result p0

    return p0
.end method
