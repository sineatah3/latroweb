.class public abstract Ll0/o;
.super Ll0/p;
.source "SourceFile"

# interfaces
.implements Ll0/j;


# static fields
.field private static final synthetic g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

.field private static final synthetic h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _delayed:Ljava/lang/Object;

.field private volatile synthetic _isCompleted:I

.field private volatile synthetic _queue:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "_queue"

    const-class v1, Ll0/o;

    const-class v2, Ljava/lang/Object;

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Ll0/o;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const-string v0, "_delayed"

    invoke-static {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Ll0/o;->h:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll0/p;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Ll0/o;->_queue:Ljava/lang/Object;

    iput-object v0, p0, Ll0/o;->_delayed:Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Ll0/o;->_isCompleted:I

    return-void
.end method

.method private final l()Ljava/lang/Runnable;
    .locals 4

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Ll0/o;->_queue:Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    instance-of v2, v0, Ln0/f;

    if-eqz v2, :cond_3

    move-object v1, v0

    check-cast v1, Ln0/f;

    invoke-virtual {v1}, Ln0/f;->j()Ljava/lang/Object;

    move-result-object v2

    sget-object v3, Ln0/f;->h:Ln0/l;

    if-eq v2, v3, :cond_2

    check-cast v2, Ljava/lang/Runnable;

    return-object v2

    :cond_2
    sget-object v2, Ll0/o;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v1}, Ln0/f;->i()Ln0/f;

    move-result-object v1

    invoke-static {v2, p0, v0, v1}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    invoke-static {}, Ll0/q;->a()Ln0/l;

    move-result-object v2

    if-ne v0, v2, :cond_4

    return-object v1

    :cond_4
    sget-object v2, Ll0/o;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-static {v2, p0, v0, v1}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    check-cast v0, Ljava/lang/Runnable;

    return-object v0
.end method

.method private final n(Ljava/lang/Runnable;)Z
    .locals 5

    .line 1
    :cond_0
    :goto_0
    iget-object v0, p0, Ll0/o;->_queue:Ljava/lang/Object;

    invoke-direct {p0}, Ll0/o;->o()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    return v2

    :cond_1
    const/4 v1, 0x1

    if-nez v0, :cond_2

    sget-object v0, Ll0/o;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const/4 v2, 0x0

    invoke-static {v0, p0, v2, p1}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_2
    instance-of v3, v0, Ln0/f;

    if-eqz v3, :cond_6

    move-object v3, v0

    check-cast v3, Ln0/f;

    invoke-virtual {v3, p1}, Ln0/f;->a(Ljava/lang/Object;)I

    move-result v4

    if-eqz v4, :cond_5

    if-eq v4, v1, :cond_4

    const/4 v0, 0x2

    if-eq v4, v0, :cond_3

    goto :goto_0

    :cond_3
    return v2

    :cond_4
    sget-object v1, Ll0/o;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v3}, Ln0/f;->i()Ln0/f;

    move-result-object v2

    invoke-static {v1, p0, v0, v2}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    invoke-static {}, Ll0/q;->a()Ln0/l;

    move-result-object v3

    if-ne v0, v3, :cond_7

    return v2

    :cond_7
    new-instance v2, Ln0/f;

    const/16 v3, 0x8

    invoke-direct {v2, v3, v1}, Ln0/f;-><init>(IZ)V

    move-object v3, v0

    check-cast v3, Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Ln0/f;->a(Ljava/lang/Object;)I

    invoke-virtual {v2, p1}, Ln0/f;->a(Ljava/lang/Object;)I

    sget-object v3, Ll0/o;->g:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-static {v3, p0, v0, v2}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1
.end method

.method private final o()Z
    .locals 1

    .line 1
    iget v0, p0, Ll0/o;->_isCompleted:I

    return v0
.end method


# virtual methods
.method public final a(Ly/e;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll0/o;->m(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected e()J
    .locals 6

    .line 1
    invoke-super {p0}, Ll0/m;->e()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-wide v2

    :cond_0
    iget-object v0, p0, Ll0/o;->_queue:Ljava/lang/Object;

    const-wide v4, 0x7fffffffffffffffL

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    instance-of v1, v0, Ln0/f;

    if-eqz v1, :cond_3

    check-cast v0, Ln0/f;

    invoke-virtual {v0}, Ln0/f;->g()Z

    move-result v0

    if-nez v0, :cond_2

    return-wide v2

    :cond_2
    :goto_0
    iget-object v0, p0, Ll0/o;->_delayed:Ljava/lang/Object;

    invoke-static {v0}, Lf/d;->a(Ljava/lang/Object;)V

    return-wide v4

    :cond_3
    invoke-static {}, Ll0/q;->a()Ln0/l;

    move-result-object v1

    if-ne v0, v1, :cond_4

    return-wide v4

    :cond_4
    return-wide v2
.end method

.method public m(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll0/o;->n(Ljava/lang/Runnable;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ll0/p;->k()V

    goto :goto_0

    :cond_0
    sget-object v0, Ll0/h;->i:Ll0/h;

    invoke-virtual {v0, p1}, Ll0/h;->m(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method protected p()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll0/m;->h()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Ll0/o;->_delayed:Ljava/lang/Object;

    invoke-static {v0}, Lf/d;->a(Ljava/lang/Object;)V

    iget-object v0, p0, Ll0/o;->_queue:Ljava/lang/Object;

    const/4 v2, 0x1

    if-nez v0, :cond_1

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    instance-of v3, v0, Ln0/f;

    if-eqz v3, :cond_2

    check-cast v0, Ln0/f;

    invoke-virtual {v0}, Ln0/f;->g()Z

    move-result v1

    goto :goto_1

    :cond_2
    invoke-static {}, Ll0/q;->a()Ln0/l;

    move-result-object v3

    if-ne v0, v3, :cond_3

    goto :goto_0

    :cond_3
    :goto_1
    return v1
.end method

.method public q()J
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll0/m;->i()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    return-wide v1

    :cond_0
    iget-object v0, p0, Ll0/o;->_delayed:Ljava/lang/Object;

    invoke-static {v0}, Lf/d;->a(Ljava/lang/Object;)V

    invoke-direct {p0}, Ll0/o;->l()Ljava/lang/Runnable;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-wide v1

    :cond_1
    invoke-virtual {p0}, Ll0/o;->e()J

    move-result-wide v0

    return-wide v0
.end method

.method protected final r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    iput-object v0, p0, Ll0/o;->_queue:Ljava/lang/Object;

    iput-object v0, p0, Ll0/o;->_delayed:Ljava/lang/Object;

    return-void
.end method
