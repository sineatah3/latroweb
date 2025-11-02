.class public abstract Ly/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/e$c;


# instance fields
.field private final a:Ld0/a;

.field private final b:Ly/e$c;


# direct methods
.method public constructor <init>(Ly/e$c;Ld0/a;)V
    .locals 1

    .line 1
    const-string v0, "baseKey"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "safeCast"

    invoke-static {p2, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ly/b;->a:Ld0/a;

    instance-of p2, p1, Ly/b;

    if-eqz p2, :cond_0

    check-cast p1, Ly/b;

    iget-object p1, p1, Ly/b;->b:Ly/e$c;

    :cond_0
    iput-object p1, p0, Ly/b;->b:Ly/e$c;

    return-void
.end method


# virtual methods
.method public final a(Ly/e$c;)Z
    .locals 1

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    if-eq p1, p0, :cond_1

    iget-object v0, p0, Ly/b;->b:Ly/e$c;

    if-ne v0, p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public final b(Ly/e$b;)Ly/e$b;
    .locals 1

    .line 1
    const-string v0, "element"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Ly/b;->a:Ld0/a;

    invoke-interface {v0, p1}, Ld0/a;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ly/e$b;

    return-object p1
.end method
