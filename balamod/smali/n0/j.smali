.class final Ln0/j;
.super Ll0/v;
.source "SourceFile"

# interfaces
.implements Ll0/j;


# instance fields
.field private final e:Ljava/lang/Throwable;

.field private final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll0/v;-><init>()V

    iput-object p1, p0, Ln0/j;->e:Ljava/lang/Throwable;

    iput-object p2, p0, Ln0/j;->f:Ljava/lang/String;

    return-void
.end method

.method private final g()Ljava/lang/Void;
    .locals 3

    .line 1
    iget-object v0, p0, Ln0/j;->e:Ljava/lang/Throwable;

    if-eqz v0, :cond_2

    iget-object v0, p0, Ln0/j;->f:Ljava/lang/String;

    const-string v1, ""

    if-eqz v0, :cond_1

    const-string v2, ". "

    invoke-static {v2, v0}, Le0/d;->j(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    move-object v1, v0

    :cond_1
    :goto_0
    const-string v0, "Module with the Main dispatcher had failed to initialize"

    invoke-static {v0, v1}, Le0/d;->j(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalStateException;

    iget-object v2, p0, Ln0/j;->e:Ljava/lang/Throwable;

    invoke-direct {v1, v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    :cond_2
    invoke-static {}, Ln0/i;->d()Ljava/lang/Void;

    new-instance v0, Lw/c;

    invoke-direct {v0}, Lw/c;-><init>()V

    throw v0
.end method


# virtual methods
.method public bridge synthetic a(Ly/e;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ln0/j;->f(Ly/e;Ljava/lang/Runnable;)Ljava/lang/Void;

    return-void
.end method

.method public b(Ly/e;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ln0/j;->g()Ljava/lang/Void;

    new-instance p1, Lw/c;

    invoke-direct {p1}, Lw/c;-><init>()V

    throw p1
.end method

.method public d()Ll0/v;
    .locals 0

    .line 1
    return-object p0
.end method

.method public f(Ly/e;Ljava/lang/Runnable;)Ljava/lang/Void;
    .locals 0

    .line 1
    invoke-direct {p0}, Ln0/j;->g()Ljava/lang/Void;

    new-instance p1, Lw/c;

    invoke-direct {p1}, Lw/c;-><init>()V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Dispatchers.Main[missing"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Ln0/j;->e:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    const-string v2, ", cause="

    invoke-static {v2, v1}, Le0/d;->j(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const-string v1, ""

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
