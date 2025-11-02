.class Landroidx/appcompat/view/menu/c$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/appcompat/view/menu/c$c;->a(Landroidx/appcompat/view/menu/e;Landroid/view/MenuItem;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic d:Landroidx/appcompat/view/menu/c$d;

.field final synthetic e:Landroid/view/MenuItem;

.field final synthetic f:Landroidx/appcompat/view/menu/e;

.field final synthetic g:Landroidx/appcompat/view/menu/c$c;


# direct methods
.method constructor <init>(Landroidx/appcompat/view/menu/c$c;Landroidx/appcompat/view/menu/c$d;Landroid/view/MenuItem;Landroidx/appcompat/view/menu/e;)V
    .locals 0

    iput-object p1, p0, Landroidx/appcompat/view/menu/c$c$a;->g:Landroidx/appcompat/view/menu/c$c;

    iput-object p2, p0, Landroidx/appcompat/view/menu/c$c$a;->d:Landroidx/appcompat/view/menu/c$d;

    iput-object p3, p0, Landroidx/appcompat/view/menu/c$c$a;->e:Landroid/view/MenuItem;

    iput-object p4, p0, Landroidx/appcompat/view/menu/c$c$a;->f:Landroidx/appcompat/view/menu/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Landroidx/appcompat/view/menu/c$c$a;->d:Landroidx/appcompat/view/menu/c$d;

    if-eqz v0, :cond_0

    iget-object v1, p0, Landroidx/appcompat/view/menu/c$c$a;->g:Landroidx/appcompat/view/menu/c$c;

    iget-object v1, v1, Landroidx/appcompat/view/menu/c$c;->a:Landroidx/appcompat/view/menu/c;

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroidx/appcompat/view/menu/c;->A:Z

    iget-object v0, v0, Landroidx/appcompat/view/menu/c$d;->b:Landroidx/appcompat/view/menu/e;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/appcompat/view/menu/e;->d(Z)V

    iget-object v0, p0, Landroidx/appcompat/view/menu/c$c$a;->g:Landroidx/appcompat/view/menu/c$c;

    iget-object v0, v0, Landroidx/appcompat/view/menu/c$c;->a:Landroidx/appcompat/view/menu/c;

    iput-boolean v1, v0, Landroidx/appcompat/view/menu/c;->A:Z

    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/menu/c$c$a;->e:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/appcompat/view/menu/c$c$a;->e:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/appcompat/view/menu/c$c$a;->f:Landroidx/appcompat/view/menu/e;

    iget-object v1, p0, Landroidx/appcompat/view/menu/c$c$a;->e:Landroid/view/MenuItem;

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/view/menu/e;->H(Landroid/view/MenuItem;I)Z

    :cond_1
    return-void
.end method
