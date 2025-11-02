.class Lr/g$c;
.super Lr/g$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lr/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# instance fields
.field private final a:Lr/g$a;


# direct methods
.method constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lr/g$b;-><init>()V

    new-instance v0, Lr/g$a;

    invoke-direct {v0, p1}, Lr/g$a;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Lr/g$c;->a:Lr/g$a;

    return-void
.end method

.method private d()Z
    .locals 1

    .line 1
    invoke-static {}, Landroidx/emoji2/text/g;->h()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method


# virtual methods
.method a([Landroid/text/InputFilter;)[Landroid/text/InputFilter;
    .locals 1

    .line 1
    invoke-direct {p0}, Lr/g$c;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lr/g$c;->a:Lr/g$a;

    invoke-virtual {v0, p1}, Lr/g$a;->a([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    move-result-object p1

    return-object p1
.end method

.method b(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lr/g$c;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lr/g$c;->a:Lr/g$a;

    invoke-virtual {v0, p1}, Lr/g$a;->b(Z)V

    return-void
.end method

.method c(Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lr/g$c;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lr/g$c;->a:Lr/g$a;

    invoke-virtual {v0, p1}, Lr/g$a;->g(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lr/g$c;->a:Lr/g$a;

    invoke-virtual {v0, p1}, Lr/g$a;->c(Z)V

    :goto_0
    return-void
.end method
