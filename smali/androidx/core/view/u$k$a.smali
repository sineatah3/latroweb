.class Landroidx/core/view/u$k$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/core/view/u$k;->u(Landroid/view/View;Landroidx/core/view/p;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field a:Landroidx/core/view/a0;

.field final synthetic b:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;Landroidx/core/view/p;)V
    .locals 0

    iput-object p1, p0, Landroidx/core/view/u$k$a;->b:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Landroidx/core/view/u$k$a;->a:Landroidx/core/view/a0;

    return-void
.end method


# virtual methods
.method public onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    invoke-static {p2, p1}, Landroidx/core/view/a0;->t(Landroid/view/WindowInsets;Landroid/view/View;)Landroidx/core/view/a0;

    move-result-object p1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/4 v2, 0x0

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Landroidx/core/view/u$k$a;->b:Landroid/view/View;

    invoke-static {p2, v0}, Landroidx/core/view/u$k;->a(Landroid/view/WindowInsets;Landroid/view/View;)V

    iget-object p2, p0, Landroidx/core/view/u$k$a;->a:Landroidx/core/view/a0;

    invoke-virtual {p1, p2}, Landroidx/core/view/a0;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    throw v2

    :cond_0
    iput-object p1, p0, Landroidx/core/view/u$k$a;->a:Landroidx/core/view/a0;

    throw v2
.end method
