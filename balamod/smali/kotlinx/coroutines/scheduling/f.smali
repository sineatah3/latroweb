.class public abstract Lkotlinx/coroutines/scheduling/f;
.super Ll0/r;
.source "SourceFile"


# instance fields
.field private final f:I

.field private final g:I

.field private final h:J

.field private final i:Ljava/lang/String;

.field private j:Lkotlinx/coroutines/scheduling/a;


# direct methods
.method public constructor <init>(IIJLjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ll0/r;-><init>()V

    iput p1, p0, Lkotlinx/coroutines/scheduling/f;->f:I

    iput p2, p0, Lkotlinx/coroutines/scheduling/f;->g:I

    iput-wide p3, p0, Lkotlinx/coroutines/scheduling/f;->h:J

    iput-object p5, p0, Lkotlinx/coroutines/scheduling/f;->i:Ljava/lang/String;

    invoke-direct {p0}, Lkotlinx/coroutines/scheduling/f;->d()Lkotlinx/coroutines/scheduling/a;

    move-result-object p1

    iput-object p1, p0, Lkotlinx/coroutines/scheduling/f;->j:Lkotlinx/coroutines/scheduling/a;

    return-void
.end method

.method private final d()Lkotlinx/coroutines/scheduling/a;
    .locals 7

    .line 1
    new-instance v6, Lkotlinx/coroutines/scheduling/a;

    iget v1, p0, Lkotlinx/coroutines/scheduling/f;->f:I

    iget v2, p0, Lkotlinx/coroutines/scheduling/f;->g:I

    iget-wide v3, p0, Lkotlinx/coroutines/scheduling/f;->h:J

    iget-object v5, p0, Lkotlinx/coroutines/scheduling/f;->i:Ljava/lang/String;

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lkotlinx/coroutines/scheduling/a;-><init>(IIJLjava/lang/String;)V

    return-object v6
.end method


# virtual methods
.method public a(Ly/e;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/f;->j:Lkotlinx/coroutines/scheduling/a;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x6

    const/4 v5, 0x0

    move-object v1, p2

    invoke-static/range {v0 .. v5}, Lkotlinx/coroutines/scheduling/a;->f(Lkotlinx/coroutines/scheduling/a;Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/i;ZILjava/lang/Object;)V

    return-void
.end method

.method public final e(Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/i;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lkotlinx/coroutines/scheduling/f;->j:Lkotlinx/coroutines/scheduling/a;

    invoke-virtual {v0, p1, p2, p3}, Lkotlinx/coroutines/scheduling/a;->e(Ljava/lang/Runnable;Lkotlinx/coroutines/scheduling/i;Z)V

    return-void
.end method
