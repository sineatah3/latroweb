.class public abstract Ly/e$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method public static a(Ly/e;Ly/e;)Ly/e;
    .locals 1

    .line 1
    const-string v0, "context"

    invoke-static {p1, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v0, Ly/f;->d:Ly/f;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Ly/e$a$a;->e:Ly/e$a$a;

    invoke-interface {p1, p0, v0}, Ly/e;->fold(Ljava/lang/Object;Ld0/b;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly/e;

    :goto_0
    return-object p0
.end method
