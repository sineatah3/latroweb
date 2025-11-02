.class public abstract Ln0/i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private static final a(Ljava/lang/Throwable;Ljava/lang/String;)Ln0/j;
    .locals 1

    .line 1
    sget-boolean v0, Ln0/i;->a:Z

    if-eqz v0, :cond_0

    new-instance v0, Ln0/j;

    invoke-direct {v0, p0, p1}, Ln0/j;-><init>(Ljava/lang/Throwable;Ljava/lang/String;)V

    return-object v0

    :cond_0
    if-nez p0, :cond_1

    invoke-static {}, Ln0/i;->d()Ljava/lang/Void;

    new-instance p0, Lw/c;

    invoke-direct {p0}, Lw/c;-><init>()V

    throw p0

    :cond_1
    throw p0
.end method

.method static synthetic b(Ljava/lang/Throwable;Ljava/lang/String;ILjava/lang/Object;)Ln0/j;
    .locals 1

    .line 1
    and-int/lit8 p3, p2, 0x1

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    move-object p0, v0

    :cond_0
    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_1

    move-object p1, v0

    :cond_1
    invoke-static {p0, p1}, Ln0/i;->a(Ljava/lang/Throwable;Ljava/lang/String;)Ln0/j;

    move-result-object p0

    return-object p0
.end method

.method public static final c(Ll0/v;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll0/v;->d()Ll0/v;

    move-result-object p0

    instance-of p0, p0, Ln0/j;

    return p0
.end method

.method public static final d()Ljava/lang/Void;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Module with the Main dispatcher is missing. Add dependency providing the Main dispatcher, e.g. \'kotlinx-coroutines-android\' and ensure it has the same version as \'kotlinx-coroutines-core\'"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final e(Ln0/g;Ljava/util/List;)Ll0/v;
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p0, p1}, Ln0/g;->createDispatcher(Ljava/util/List;)Ll0/v;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    invoke-interface {p0}, Ln0/g;->hintOnError()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Ln0/i;->a(Ljava/lang/Throwable;Ljava/lang/String;)Ln0/j;

    move-result-object p0

    :goto_0
    return-object p0
.end method
