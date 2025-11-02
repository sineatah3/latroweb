.class public abstract Ly/e$b$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/e$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method public static a(Ly/e$b;Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;
    .locals 1

    .line 1
    const-string v0, "operation"

    invoke-static {p2, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p2, p1, p0}, Ld0/b;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static b(Ly/e$b;Ly/e$c;)Ly/e$b;
    .locals 1

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Ly/e$b;->getKey()Ly/e$c;

    move-result-object v0

    invoke-static {v0, p1}, Le0/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "null cannot be cast to non-null type E of kotlin.coroutines.CoroutineContext.Element.get"

    invoke-static {p0, p1}, Le0/d;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static c(Ly/e$b;Ly/e$c;)Ly/e;
    .locals 1

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Ly/e$b;->getKey()Ly/e$c;

    move-result-object v0

    invoke-static {v0, p1}, Le0/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p0, Ly/f;->d:Ly/f;

    :cond_0
    return-object p0
.end method

.method public static d(Ly/e$b;Ly/e;)Ly/e;
    .locals 1

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Ly/e$a;->a(Ly/e;Ly/e;)Ly/e;

    move-result-object p0

    return-object p0
.end method
