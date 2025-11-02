.class abstract Lx/h;
.super Lx/g;
.source "SourceFile"


# direct methods
.method public static final b()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lx/r;->d:Lx/r;

    return-object v0
.end method

.method public static c(Ljava/util/List;)Ljava/util/List;
    .locals 2

    .line 1
    const-string v0, "<this>"

    invoke-static {p0, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lx/g;->a(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-static {}, Lx/h;->b()Ljava/util/List;

    move-result-object p0

    :goto_0
    return-object p0
.end method
