.class Lorg/love2d/android/GameActivity$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/love2d/android/GameActivity;->handleIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lorg/love2d/android/GameActivity;


# direct methods
.method constructor <init>(Lorg/love2d/android/GameActivity;)V
    .locals 0

    iput-object p1, p0, Lorg/love2d/android/GameActivity$a;->a:Lorg/love2d/android/GameActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lorg/love2d/android/GameActivity$a;->a:Lorg/love2d/android/GameActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method
