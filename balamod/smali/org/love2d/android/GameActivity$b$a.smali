.class Lorg/love2d/android/GameActivity$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/love2d/android/GameActivity$b;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lorg/love2d/android/GameActivity$b;


# direct methods
.method constructor <init>(Lorg/love2d/android/GameActivity$b;)V
    .locals 0

    iput-object p1, p0, Lorg/love2d/android/GameActivity$b$a;->a:Lorg/love2d/android/GameActivity$b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lorg/love2d/android/GameActivity$b$a;->a:Lorg/love2d/android/GameActivity$b;

    iget-object p1, p1, Lorg/love2d/android/GameActivity$b;->d:Lorg/love2d/android/GameActivity;

    iget-object p1, p1, Lorg/love2d/android/GameActivity;->recordAudioRequestDummy:[I

    monitor-enter p1

    :try_start_0
    iget-object p2, p0, Lorg/love2d/android/GameActivity$b$a;->a:Lorg/love2d/android/GameActivity$b;

    iget-object p2, p2, Lorg/love2d/android/GameActivity$b;->d:Lorg/love2d/android/GameActivity;

    iget-object p2, p2, Lorg/love2d/android/GameActivity;->recordAudioRequestDummy:[I

    invoke-virtual {p2}, Ljava/lang/Object;->notify()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method
