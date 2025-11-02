.class Lorg/libsdl/app/SDLAudioManager$1;
.super Landroid/media/AudioDeviceCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/libsdl/app/SDLAudioManager;->initialize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/media/AudioDeviceCallback;-><init>()V

    return-void
.end method

.method public static synthetic a(Landroid/media/AudioDeviceInfo;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lorg/libsdl/app/SDLAudioManager$1;->lambda$onAudioDevicesAdded$0(Landroid/media/AudioDeviceInfo;)V

    return-void
.end method

.method public static synthetic b(Landroid/media/AudioDeviceInfo;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lorg/libsdl/app/SDLAudioManager$1;->lambda$onAudioDevicesRemoved$1(Landroid/media/AudioDeviceInfo;)V

    return-void
.end method

.method private static synthetic lambda$onAudioDevicesAdded$0(Landroid/media/AudioDeviceInfo;)V
    .locals 1

    invoke-static {p0}, Lorg/libsdl/app/n1;->a(Landroid/media/AudioDeviceInfo;)Z

    move-result v0

    invoke-static {p0}, Lorg/libsdl/app/f1;->a(Landroid/media/AudioDeviceInfo;)I

    move-result p0

    invoke-static {v0, p0}, Lorg/libsdl/app/SDLAudioManager;->addAudioDevice(ZI)V

    return-void
.end method

.method private static synthetic lambda$onAudioDevicesRemoved$1(Landroid/media/AudioDeviceInfo;)V
    .locals 1

    invoke-static {p0}, Lorg/libsdl/app/n1;->a(Landroid/media/AudioDeviceInfo;)Z

    move-result v0

    invoke-static {p0}, Lorg/libsdl/app/f1;->a(Landroid/media/AudioDeviceInfo;)I

    move-result p0

    invoke-static {v0, p0}, Lorg/libsdl/app/SDLAudioManager;->removeAudioDevice(ZI)V

    return-void
.end method


# virtual methods
.method public onAudioDevicesAdded([Landroid/media/AudioDeviceInfo;)V
    .locals 1

    invoke-static {p1}, Lorg/libsdl/app/e1;->a([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lorg/libsdl/app/q1;

    invoke-direct {v0}, Lorg/libsdl/app/q1;-><init>()V

    invoke-static {p1, v0}, Lorg/libsdl/app/o1;->a(Ljava/util/stream/Stream;Ljava/util/function/Consumer;)V

    return-void
.end method

.method public onAudioDevicesRemoved([Landroid/media/AudioDeviceInfo;)V
    .locals 1

    invoke-static {p1}, Lorg/libsdl/app/e1;->a([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p1

    new-instance v0, Lorg/libsdl/app/p1;

    invoke-direct {v0}, Lorg/libsdl/app/p1;-><init>()V

    invoke-static {p1, v0}, Lorg/libsdl/app/o1;->a(Ljava/util/stream/Stream;Ljava/util/function/Consumer;)V

    return-void
.end method
