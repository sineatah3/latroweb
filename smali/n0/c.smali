.class public final Ln0/c;
.super Ll0/c;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ll0/j;


# instance fields
.field private final e:Ll0/c;

.field private final f:I

.field private final synthetic g:Ll0/j;

.field private final h:Ln0/e;

.field private final i:Ljava/lang/Object;

.field private volatile runningWorkers:I


# direct methods
.method public constructor <init>(Ll0/c;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll0/c;-><init>()V

    iput-object p1, p0, Ln0/c;->e:Ll0/c;

    iput p2, p0, Ln0/c;->f:I

    instance-of p2, p1, Ll0/j;

    if-eqz p2, :cond_0

    check-cast p1, Ll0/j;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    invoke-static {}, Ll0/i;->a()Ll0/j;

    move-result-object p1

    :cond_1
    iput-object p1, p0, Ln0/c;->g:Ll0/j;

    new-instance p1, Ln0/e;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ln0/e;-><init>(Z)V

    iput-object p1, p0, Ln0/c;->h:Ln0/e;

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln0/c;->i:Ljava/lang/Object;

    return-void
.end method

.method private final d(Ljava/lang/Runnable;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ln0/c;->h:Ln0/e;

    invoke-virtual {v0, p1}, Ln0/e;->a(Ljava/lang/Object;)Z

    iget p1, p0, Ln0/c;->runningWorkers:I

    iget v0, p0, Ln0/c;->f:I

    if-lt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private final e()Z
    .locals 3

    .line 1
    iget-object v0, p0, Ln0/c;->i:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Ln0/c;->runningWorkers:I

    iget v2, p0, Ln0/c;->f:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v1, v2, :cond_0

    monitor-exit v0

    const/4 v0, 0x0

    return v0

    :cond_0
    :try_start_1
    iget v1, p0, Ln0/c;->runningWorkers:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Ln0/c;->runningWorkers:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method public a(Ly/e;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ln0/c;->d(Ljava/lang/Runnable;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Ln0/c;->e()Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Ln0/c;->e:Ll0/c;

    invoke-virtual {p1, p0, p0}, Ll0/c;->a(Ly/e;Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x0

    :cond_0
    iget-object v2, p0, Ln0/c;->h:Ln0/e;

    invoke-virtual {v2}, Ln0/e;->d()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Runnable;

    if-eqz v2, :cond_1

    :try_start_0
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v2

    sget-object v3, Ly/f;->d:Ly/f;

    invoke-static {v3, v2}, Ll0/f;->a(Ly/e;Ljava/lang/Throwable;)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    iget-object v2, p0, Ln0/c;->e:Ll0/c;

    invoke-virtual {v2, p0}, Ll0/c;->b(Ly/e;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v0, p0, Ln0/c;->e:Ll0/c;

    invoke-virtual {v0, p0, p0}, Ll0/c;->a(Ly/e;Ljava/lang/Runnable;)V

    return-void

    :cond_1
    iget-object v1, p0, Ln0/c;->i:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget v2, p0, Ln0/c;->runningWorkers:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Ln0/c;->runningWorkers:I

    iget-object v2, p0, Ln0/c;->h:Ln0/e;

    invoke-virtual {v2}, Ln0/e;->c()I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez v2, :cond_2

    monitor-exit v1

    return-void

    :cond_2
    :try_start_2
    iget v2, p0, Ln0/c;->runningWorkers:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Ln0/c;->runningWorkers:I

    sget-object v2, Lw/f;->a:Lw/f;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v1

    goto :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method
