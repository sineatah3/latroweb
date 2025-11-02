.class abstract Lj0/f;
.super Lj0/e;
.source "SourceFile"


# direct methods
.method public static a(Ljava/util/Iterator;)Lj0/b;
    .locals 1

    .line 1
    const-string v0, "<this>"

    invoke-static {p0, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lj0/f$a;

    invoke-direct {v0, p0}, Lj0/f$a;-><init>(Ljava/util/Iterator;)V

    invoke-static {v0}, Lj0/f;->b(Lj0/b;)Lj0/b;

    move-result-object p0

    return-object p0
.end method

.method public static final b(Lj0/b;)Lj0/b;
    .locals 1

    .line 1
    const-string v0, "<this>"

    invoke-static {p0, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    instance-of v0, p0, Lj0/a;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lj0/a;

    invoke-direct {v0, p0}, Lj0/a;-><init>(Lj0/b;)V

    move-object p0, v0

    :goto_0
    return-object p0
.end method
