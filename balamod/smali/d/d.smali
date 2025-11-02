.class public abstract Ld/d;
.super Ld/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ld/d$a;
    }
.end annotation


# instance fields
.field private m:Ld/d$a;

.field private n:Z


# direct methods
.method constructor <init>(Ld/d$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ld/b;-><init>()V

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Ld/d;->h(Ld/b$d;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public applyTheme(Landroid/content/res/Resources$Theme;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ld/b;->applyTheme(Landroid/content/res/Resources$Theme;)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/d;->onStateChange([I)Z

    return-void
.end method

.method h(Ld/b$d;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ld/b;->h(Ld/b$d;)V

    instance-of v0, p1, Ld/d$a;

    if-eqz v0, :cond_0

    check-cast p1, Ld/d$a;

    iput-object p1, p0, Ld/d;->m:Ld/d$a;

    :cond_0
    return-void
.end method

.method j(Landroid/util/AttributeSet;)[I
    .locals 8

    .line 1
    invoke-interface {p1}, Landroid/util/AttributeSet;->getAttributeCount()I

    move-result v0

    new-array v1, v0, [I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v0, :cond_2

    invoke-interface {p1, v3}, Landroid/util/AttributeSet;->getAttributeNameResource(I)I

    move-result v5

    if-eqz v5, :cond_1

    const v6, 0x10100d0

    if-eq v5, v6, :cond_1

    const v6, 0x1010199

    if-eq v5, v6, :cond_1

    add-int/lit8 v6, v4, 0x1

    invoke-interface {p1, v3, v2}, Landroid/util/AttributeSet;->getAttributeBooleanValue(IZ)Z

    move-result v7

    if-eqz v7, :cond_0

    goto :goto_1

    :cond_0
    neg-int v5, v5

    :goto_1
    aput v5, v1, v4

    move v4, v6

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    invoke-static {v1, v4}, Landroid/util/StateSet;->trimStateSet([II)[I

    move-result-object p1

    return-object p1
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ld/d;->n:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Ld/b;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_0

    iget-object v0, p0, Ld/d;->m:Ld/d$a;

    invoke-virtual {v0}, Ld/d$a;->r()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ld/d;->n:Z

    :cond_0
    return-object p0
.end method

.method protected abstract onStateChange([I)Z
.end method
