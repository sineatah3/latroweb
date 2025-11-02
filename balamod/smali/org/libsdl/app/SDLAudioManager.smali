.class public Lorg/libsdl/app/SDLAudioManager;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final NO_DEVICES:[I

.field protected static final TAG:Ljava/lang/String; = "SDLAudio"

.field private static mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

.field protected static mAudioRecord:Landroid/media/AudioRecord;

.field protected static mAudioTrack:Landroid/media/AudioTrack;

.field protected static mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [I

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->NO_DEVICES:[I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(ILandroid/media/AudioDeviceInfo;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lorg/libsdl/app/SDLAudioManager;->lambda$getInputAudioDeviceInfo$0(ILandroid/media/AudioDeviceInfo;)Z

    move-result p0

    return p0
.end method

.method public static native addAudioDevice(ZI)V
.end method

.method public static audioClose()V
    .locals 1

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/media/AudioTrack;->stop()V

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    :cond_0
    return-void
.end method

.method public static audioOpen(IIIII)[I
    .locals 6

    const/4 v0, 0x0

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lorg/libsdl/app/SDLAudioManager;->open(ZIIIII)[I

    move-result-object p0

    return-object p0
.end method

.method public static audioSetThreadPriority(ZI)V
    .locals 2

    if-eqz p0, :cond_0

    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SDLAudioC"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SDLAudioP"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :goto_1
    const/16 p0, -0x10

    invoke-static {p0}, Landroid/os/Process;->setThreadPriority(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "modify thread properties failed "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "SDLAudio"

    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    return-void
.end method

.method public static audioWriteByteBuffer([B)V
    .locals 4

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    const-string v1, "SDLAudio"

    if-nez v0, :cond_0

    const-string p0, "Attempted to make audio call with uninitialized audio!"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_3

    sget-object v2, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    array-length v3, p0

    sub-int/2addr v3, v0

    invoke-virtual {v2, p0, v0, v3}, Landroid/media/AudioTrack;->write([BII)I

    move-result v2

    if-lez v2, :cond_1

    add-int/2addr v0, v2

    goto :goto_0

    :cond_1
    if-nez v2, :cond_2

    const-wide/16 v2, 0x1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    goto :goto_0

    :cond_2
    const-string p0, "SDL audio: error return from write(byte)"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void
.end method

.method public static audioWriteFloatBuffer([F)V
    .locals 5

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    const-string v1, "SDLAudio"

    if-nez v0, :cond_0

    const-string p0, "Attempted to make audio call with uninitialized audio!"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v0, v2, :cond_1

    const-string p0, "Attempted to make an incompatible audio call with uninitialized audio! (floating-point output is supported since Android 5.0 Lollipop)"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_4

    sget-object v3, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    array-length v4, p0

    sub-int/2addr v4, v2

    invoke-static {v3, p0, v2, v4, v0}, Lorg/libsdl/app/y0;->a(Landroid/media/AudioTrack;[FIII)I

    move-result v3

    if-lez v3, :cond_2

    add-int/2addr v2, v3

    goto :goto_0

    :cond_2
    if-nez v3, :cond_3

    const-wide/16 v3, 0x1

    :try_start_0
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    goto :goto_0

    :cond_3
    const-string p0, "SDL audio: error return from write(float)"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return-void
.end method

.method public static audioWriteShortBuffer([S)V
    .locals 4

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    const-string v1, "SDLAudio"

    if-nez v0, :cond_0

    const-string p0, "Attempted to make audio call with uninitialized audio!"

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_3

    sget-object v2, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    array-length v3, p0

    sub-int/2addr v3, v0

    invoke-virtual {v2, p0, v0, v3}, Landroid/media/AudioTrack;->write([SII)I

    move-result v2

    if-lez v2, :cond_1

    add-int/2addr v0, v2

    goto :goto_0

    :cond_1
    if-nez v2, :cond_2

    const-wide/16 v2, 0x1

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    goto :goto_0

    :cond_2
    const-string p0, "SDL audio: error return from write(short)"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void
.end method

.method public static synthetic b(ILandroid/media/AudioDeviceInfo;)Z
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lorg/libsdl/app/SDLAudioManager;->lambda$getOutputAudioDeviceInfo$1(ILandroid/media/AudioDeviceInfo;)Z

    move-result p0

    return p0
.end method

.method public static captureClose()V
    .locals 1

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    :cond_0
    return-void
.end method

.method public static captureOpen(IIIII)[I
    .locals 6

    const/4 v0, 0x1

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lorg/libsdl/app/SDLAudioManager;->open(ZIIIII)[I

    move-result-object p0

    return-object p0
.end method

.method public static captureReadByteBuffer([BZ)I
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    sget-object p1, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    array-length v0, p0

    invoke-virtual {p1, p0, v2, v0}, Landroid/media/AudioRecord;->read([BII)I

    move-result p0

    return p0

    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    array-length v1, p0

    xor-int/lit8 p1, p1, 0x1

    invoke-static {v0, p0, v2, v1, p1}, Lorg/libsdl/app/a1;->a(Landroid/media/AudioRecord;[BIII)I

    move-result p0

    return p0
.end method

.method public static captureReadFloatBuffer([FZ)I
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    return v2

    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    array-length v1, p0

    xor-int/lit8 p1, p1, 0x1

    invoke-static {v0, p0, v2, v1, p1}, Lorg/libsdl/app/z0;->a(Landroid/media/AudioRecord;[FIII)I

    move-result p0

    return p0
.end method

.method public static captureReadShortBuffer([SZ)I
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    sget-object p1, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    array-length v0, p0

    invoke-virtual {p1, p0, v2, v0}, Landroid/media/AudioRecord;->read([SII)I

    move-result p0

    return p0

    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    array-length v1, p0

    xor-int/lit8 p1, p1, 0x1

    invoke-static {v0, p0, v2, v1, p1}, Lorg/libsdl/app/x0;->a(Landroid/media/AudioRecord;[SIII)I

    move-result p0

    return p0
.end method

.method protected static getAudioFormatString(I)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    if-eq p0, v0, :cond_2

    const/4 v0, 0x3

    if-eq p0, v0, :cond_1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_0

    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, "float"

    return-object p0

    :cond_1
    const-string p0, "8-bit"

    return-object p0

    :cond_2
    const-string p0, "16-bit"

    return-object p0
.end method

.method public static getAudioInputDevices()[I
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/libsdl/app/d1;->a(Landroid/media/AudioManager;I)[Landroid/media/AudioDeviceInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/e1;->a([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lorg/libsdl/app/l1;

    invoke-direct {v1}, Lorg/libsdl/app/l1;-><init>()V

    invoke-static {v0, v1}, Lorg/libsdl/app/g1;->a(Ljava/util/stream/Stream;Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/h1;->a(Ljava/util/stream/IntStream;)[I

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->NO_DEVICES:[I

    return-object v0
.end method

.method public static getAudioOutputDevices()[I
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lorg/libsdl/app/d1;->a(Landroid/media/AudioManager;I)[Landroid/media/AudioDeviceInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/e1;->a([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lorg/libsdl/app/j1;

    invoke-direct {v1}, Lorg/libsdl/app/j1;-><init>()V

    invoke-static {v0, v1}, Lorg/libsdl/app/g1;->a(Ljava/util/stream/Stream;Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/h1;->a(Ljava/util/stream/IntStream;)[I

    move-result-object v0

    return-object v0

    :cond_0
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->NO_DEVICES:[I

    return-object v0
.end method

.method private static getInputAudioDeviceInfo(I)Landroid/media/AudioDeviceInfo;
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/libsdl/app/d1;->a(Landroid/media/AudioManager;I)[Landroid/media/AudioDeviceInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/e1;->a([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lorg/libsdl/app/k1;

    invoke-direct {v1, p0}, Lorg/libsdl/app/k1;-><init>(I)V

    invoke-static {v0, v1}, Lorg/libsdl/app/t0;->a(Ljava/util/stream/Stream;Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    invoke-static {p0}, Lorg/libsdl/app/u0;->a(Ljava/util/stream/Stream;)Ljava/util/Optional;

    move-result-object p0

    invoke-static {p0, v2}, Lorg/libsdl/app/v0;->a(Ljava/util/Optional;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorg/libsdl/app/w0;->a(Ljava/lang/Object;)Landroid/media/AudioDeviceInfo;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v2
.end method

.method private static getOutputAudioDeviceInfo(I)Landroid/media/AudioDeviceInfo;
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    const/4 v2, 0x0

    if-lt v0, v1, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lorg/libsdl/app/d1;->a(Landroid/media/AudioManager;I)[Landroid/media/AudioDeviceInfo;

    move-result-object v0

    invoke-static {v0}, Lorg/libsdl/app/e1;->a([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lorg/libsdl/app/m1;

    invoke-direct {v1, p0}, Lorg/libsdl/app/m1;-><init>(I)V

    invoke-static {v0, v1}, Lorg/libsdl/app/t0;->a(Ljava/util/stream/Stream;Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object p0

    invoke-static {p0}, Lorg/libsdl/app/u0;->a(Ljava/util/stream/Stream;)Ljava/util/Optional;

    move-result-object p0

    invoke-static {p0, v2}, Lorg/libsdl/app/v0;->a(Ljava/util/Optional;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorg/libsdl/app/w0;->a(Ljava/lang/Object;)Landroid/media/AudioDeviceInfo;

    move-result-object p0

    return-object p0

    :cond_0
    return-object v2
.end method

.method public static initialize()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    new-instance v0, Lorg/libsdl/app/SDLAudioManager$1;

    invoke-direct {v0}, Lorg/libsdl/app/SDLAudioManager$1;-><init>()V

    sput-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    :cond_0
    return-void
.end method

.method private static synthetic lambda$getInputAudioDeviceInfo$0(ILandroid/media/AudioDeviceInfo;)Z
    .locals 0

    invoke-static {p1}, Lorg/libsdl/app/f1;->a(Landroid/media/AudioDeviceInfo;)I

    move-result p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static synthetic lambda$getOutputAudioDeviceInfo$1(ILandroid/media/AudioDeviceInfo;)Z
    .locals 0

    invoke-static {p1}, Lorg/libsdl/app/f1;->a(Landroid/media/AudioDeviceInfo;)I

    move-result p1

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static native nativeSetupJNI()I
.end method

.method protected static open(ZIIIII)[I
    .locals 26

    move/from16 v0, p1

    move/from16 v1, p3

    move/from16 v2, p4

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Opening "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "capture"

    const-string v6, "playback"

    if-eqz p0, :cond_0

    move-object v7, v5

    goto :goto_0

    :cond_0
    move-object v7, v6

    :goto_0
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", requested "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " frames of "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v8, " channel "

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Lorg/libsdl/app/SDLAudioManager;->getAudioFormatString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " audio at "

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " Hz"

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v11, "SDLAudio"

    invoke-static {v11, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x15

    const/4 v13, 0x2

    if-ge v3, v12, :cond_1

    if-le v1, v13, :cond_1

    const/4 v1, 0x2

    :cond_1
    const/16 v14, 0x16

    if-ge v3, v14, :cond_3

    const/16 v14, 0x1f40

    if-ge v0, v14, :cond_2

    goto :goto_1

    :cond_2
    const v14, 0xbb80

    if-le v0, v14, :cond_3

    goto :goto_1

    :cond_3
    move v14, v0

    :goto_1
    const/4 v15, 0x4

    move/from16 v12, p2

    if-ne v12, v15, :cond_5

    if-eqz p0, :cond_4

    const/16 v0, 0x17

    goto :goto_2

    :cond_4
    const/16 v0, 0x15

    :goto_2
    if-ge v3, v0, :cond_5

    const/4 v12, 0x2

    :cond_5
    const/4 v0, 0x3

    if-eq v12, v13, :cond_8

    if-eq v12, v0, :cond_7

    const/4 v0, 0x4

    if-eq v12, v0, :cond_6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Requested format "

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, ", getting ENCODING_PCM_16BIT"

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x2

    const/4 v12, 0x2

    goto :goto_3

    :cond_6
    const/4 v0, 0x4

    goto :goto_3

    :cond_7
    const/4 v0, 0x1

    goto :goto_3

    :cond_8
    const/4 v0, 0x2

    :goto_3
    const-string v13, " channels, getting stereo"

    const-string v15, "Requested "

    const/16 v17, 0xc

    move-object/from16 v22, v5

    if-eqz p0, :cond_a

    const/4 v5, 0x1

    if-eq v1, v5, :cond_9

    const/4 v5, 0x2

    if-eq v1, v5, :cond_c

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    goto :goto_4

    :cond_9
    const/16 v5, 0x10

    goto :goto_7

    :cond_a
    packed-switch v1, :pswitch_data_0

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    :goto_4
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x2

    goto :goto_6

    :pswitch_0
    const/16 v5, 0x17

    if-lt v3, v5, :cond_b

    const/16 v5, 0x18fc

    goto :goto_7

    :cond_b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " channels, getting 5.1 surround"

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v11, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x6

    goto :goto_5

    :pswitch_1
    const/16 v5, 0x4fc

    goto :goto_7

    :goto_5
    :pswitch_2
    const/16 v5, 0xfc

    goto :goto_7

    :pswitch_3
    const/16 v5, 0xdc

    goto :goto_7

    :pswitch_4
    const/16 v5, 0xcc

    goto :goto_7

    :pswitch_5
    const/16 v5, 0x1c

    goto :goto_7

    :cond_c
    :goto_6
    :pswitch_6
    const/16 v5, 0xc

    goto :goto_7

    :pswitch_7
    const/4 v5, 0x4

    :goto_7
    mul-int v0, v0, v1

    if-eqz p0, :cond_d

    invoke-static {v14, v5, v12}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result v1

    goto :goto_8

    :cond_d
    invoke-static {v14, v5, v12}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    move-result v1

    :goto_8
    add-int/2addr v1, v0

    const/4 v13, 0x1

    sub-int/2addr v1, v13

    div-int/2addr v1, v0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    const/4 v2, 0x4

    new-array v2, v2, [I

    const/16 v23, 0x0

    const/16 v24, 0x0

    if-eqz p0, :cond_11

    sget-object v15, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    if-nez v15, :cond_10

    new-instance v21, Landroid/media/AudioRecord;

    const/16 v16, 0x0

    mul-int v20, v1, v0

    move-object/from16 v15, v21

    move/from16 v17, v14

    move/from16 v18, v5

    move/from16 v19, v12

    invoke-direct/range {v15 .. v20}, Landroid/media/AudioRecord;-><init>(IIIII)V

    sput-object v21, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual/range {v21 .. v21}, Landroid/media/AudioRecord;->getState()I

    move-result v0

    if-eq v0, v13, :cond_e

    const-string v0, "Failed during initialization of AudioRecord"

    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->release()V

    sput-object v24, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    return-object v24

    :cond_e
    const/16 v0, 0x18

    if-lt v3, v0, :cond_f

    if-eqz p5, :cond_f

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-static/range {p5 .. p5}, Lorg/libsdl/app/SDLAudioManager;->getOutputAudioDeviceInfo(I)Landroid/media/AudioDeviceInfo;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/libsdl/app/b1;->a(Landroid/media/AudioRecord;Landroid/media/AudioDeviceInfo;)Z

    :cond_f
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    :cond_10
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getSampleRate()I

    move-result v0

    aput v0, v2, v23

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getAudioFormat()I

    move-result v0

    aput v0, v2, v13

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioRecord:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->getChannelCount()I

    move-result v0

    const/4 v3, 0x2

    aput v0, v2, v3

    goto :goto_9

    :cond_11
    sget-object v15, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    if-nez v15, :cond_14

    new-instance v25, Landroid/media/AudioTrack;

    const/16 v16, 0x3

    mul-int v20, v1, v0

    const/16 v21, 0x1

    move-object/from16 v15, v25

    move/from16 v17, v14

    move/from16 v18, v5

    move/from16 v19, v12

    invoke-direct/range {v15 .. v21}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    sput-object v25, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual/range {v25 .. v25}, Landroid/media/AudioTrack;->getState()I

    move-result v0

    if-eq v0, v13, :cond_12

    const-string v0, "Failed during initialization of Audio Track"

    invoke-static {v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->release()V

    sput-object v24, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    return-object v24

    :cond_12
    const/16 v0, 0x18

    if-lt v3, v0, :cond_13

    if-eqz p5, :cond_13

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-static/range {p5 .. p5}, Lorg/libsdl/app/SDLAudioManager;->getInputAudioDeviceInfo(I)Landroid/media/AudioDeviceInfo;

    move-result-object v3

    invoke-static {v0, v3}, Lorg/libsdl/app/c1;->a(Landroid/media/AudioTrack;Landroid/media/AudioDeviceInfo;)Z

    :cond_13
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->play()V

    :cond_14
    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getSampleRate()I

    move-result v0

    aput v0, v2, v23

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getAudioFormat()I

    move-result v0

    aput v0, v2, v13

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioTrack:Landroid/media/AudioTrack;

    invoke-virtual {v0}, Landroid/media/AudioTrack;->getChannelCount()I

    move-result v0

    const/4 v3, 0x2

    aput v0, v2, v3

    :goto_9
    const/4 v0, 0x3

    aput v1, v2, v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :cond_15

    move-object/from16 v5, v22

    goto :goto_a

    :cond_15
    move-object v5, v6

    :goto_a
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", got "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v0, v2, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x2

    aget v0, v2, v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v0, v2, v13

    invoke-static {v0}, Lorg/libsdl/app/SDLAudioManager;->getAudioFormatString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget v0, v2, v23

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static registerAudioDeviceCallback()V
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    sget-object v1, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lorg/libsdl/app/i1;->a(Landroid/media/AudioManager;Landroid/media/AudioDeviceCallback;Landroid/os/Handler;)V

    :cond_0
    return-void
.end method

.method public static release(Landroid/content/Context;)V
    .locals 0

    invoke-static {p0}, Lorg/libsdl/app/SDLAudioManager;->unregisterAudioDeviceCallback(Landroid/content/Context;)V

    return-void
.end method

.method public static native removeAudioDevice(ZI)V
.end method

.method public static setContext(Landroid/content/Context;)V
    .locals 0

    sput-object p0, Lorg/libsdl/app/SDLAudioManager;->mContext:Landroid/content/Context;

    if-eqz p0, :cond_0

    invoke-static {}, Lorg/libsdl/app/SDLAudioManager;->registerAudioDeviceCallback()V

    :cond_0
    return-void
.end method

.method private static unregisterAudioDeviceCallback(Landroid/content/Context;)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_0

    const-string v0, "audio"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/media/AudioManager;

    sget-object v0, Lorg/libsdl/app/SDLAudioManager;->mAudioDeviceCallback:Landroid/media/AudioDeviceCallback;

    invoke-static {p0, v0}, Lorg/libsdl/app/s0;->a(Landroid/media/AudioManager;Landroid/media/AudioDeviceCallback;)V

    :cond_0
    return-void
.end method
