.class public abstract Ly/d$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method public static a(Ly/d;Ly/e$c;)Ly/e$b;
    .locals 2

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p1, Ly/b;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Ly/b;

    invoke-interface {p0}, Ly/e$b;->getKey()Ly/e$c;

    move-result-object v0

    invoke-virtual {p1, v0}, Ly/b;->a(Ly/e$c;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p0}, Ly/b;->b(Ly/e$b;)Ly/e$b;

    move-result-object p0

    instance-of p1, p0, Ly/e$b;

    if-eqz p1, :cond_0

    move-object v1, p0

    :cond_0
    return-object v1

    :cond_1
    sget-object v0, Ly/d;->c:Ly/d$b;

    if-ne v0, p1, :cond_2

    const-string p1, "null cannot be cast to non-null type E of kotlin.coroutines.ContinuationInterceptor.get"

    invoke-static {p0, p1}, Le0/d;->c(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object p0, v1

    :goto_0
    return-object p0
.end method

.method public static b(Ly/d;Ly/e$c;)Ly/e;
    .locals 1

    .line 1
    const-string v0, "key"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p1, Ly/b;

    if-eqz v0, :cond_1

    check-cast p1, Ly/b;

    invoke-interface {p0}, Ly/e$b;->getKey()Ly/e$c;

    move-result-object v0

    invoke-virtual {p1, v0}, Ly/b;->a(Ly/e$c;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p0}, Ly/b;->b(Ly/e$b;)Ly/e$b;

    move-result-object p1

    if-eqz p1, :cond_0

    sget-object p0, Ly/f;->d:Ly/f;

    :cond_0
    return-object p0

    :cond_1
    sget-object v0, Ly/d;->c:Ly/d$b;

    if-ne v0, p1, :cond_2

    sget-object p0, Ly/f;->d:Ly/f;

    :cond_2
    return-object p0
.end method
