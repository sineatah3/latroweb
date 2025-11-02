.class public final Ll0/x;
.super Ll0/c;
.source "SourceFile"


# static fields
.field public static final e:Ll0/x;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll0/x;

    invoke-direct {v0}, Ll0/x;-><init>()V

    sput-object v0, Ll0/x;->e:Ll0/x;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ll0/c;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ly/e;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    sget-object p2, Ll0/y;->d:Ll0/y$a;

    invoke-interface {p1, p2}, Ly/e;->get(Ly/e$c;)Ly/e$b;

    move-result-object p1

    invoke-static {p1}, Lf/d;->a(Ljava/lang/Object;)V

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Dispatchers.Unconfined.dispatch function can only be used by the yield function. If you wrap Unconfined dispatcher in your code, make sure you properly delegate isDispatchNeeded and dispatch calls."

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public b(Ly/e;)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "Dispatchers.Unconfined"

    return-object v0
.end method
