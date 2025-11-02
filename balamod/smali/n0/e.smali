.class public Ln0/e;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final synthetic a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;


# instance fields
.field private volatile synthetic _cur:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-class v0, Ljava/lang/Object;

    const-string v1, "_cur"

    const-class v2, Ln0/e;

    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Ln0/e;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ln0/f;

    const/16 v1, 0x8

    invoke-direct {v0, v1, p1}, Ln0/f;-><init>(IZ)V

    iput-object v0, p0, Ln0/e;->_cur:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ln0/e;->_cur:Ljava/lang/Object;

    check-cast v0, Ln0/f;

    invoke-virtual {v0, p1}, Ln0/f;->a(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    if-eq v1, v2, :cond_1

    const/4 v0, 0x2

    if-eq v1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    sget-object v1, Ln0/e;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0}, Ln0/f;->i()Ln0/f;

    move-result-object v2

    invoke-static {v1, p0, v0, v2}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return v2
.end method

.method public final b()V
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ln0/e;->_cur:Ljava/lang/Object;

    check-cast v0, Ln0/f;

    invoke-virtual {v0}, Ln0/f;->d()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    sget-object v1, Ln0/e;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0}, Ln0/f;->i()Ln0/f;

    move-result-object v2

    invoke-static {v1, p0, v0, v2}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public final c()I
    .locals 1

    .line 1
    iget-object v0, p0, Ln0/e;->_cur:Ljava/lang/Object;

    check-cast v0, Ln0/f;

    invoke-virtual {v0}, Ln0/f;->f()I

    move-result v0

    return v0
.end method

.method public final d()Ljava/lang/Object;
    .locals 3

    .line 1
    :goto_0
    iget-object v0, p0, Ln0/e;->_cur:Ljava/lang/Object;

    check-cast v0, Ln0/f;

    invoke-virtual {v0}, Ln0/f;->j()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Ln0/f;->h:Ln0/l;

    if-eq v1, v2, :cond_0

    return-object v1

    :cond_0
    sget-object v1, Ln0/e;->a:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    invoke-virtual {v0}, Ln0/f;->i()Ln0/f;

    move-result-object v2

    invoke-static {v1, p0, v0, v2}, Ll0/n;->a(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    goto :goto_0
.end method
