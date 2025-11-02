.class public abstract Lw/e;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final a(Ljava/lang/Throwable;)Ljava/lang/Object;
    .locals 1

    .line 1
    const-string v0, "exception"

    invoke-static {p0, v0}, Le0/d;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lw/d$b;

    invoke-direct {v0, p0}, Lw/d$b;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method
