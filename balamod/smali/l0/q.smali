.class public abstract Ll0/q;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ln0/l;

.field private static final b:Ln0/l;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ln0/l;

    const-string v1, "REMOVED_TASK"

    invoke-direct {v0, v1}, Ln0/l;-><init>(Ljava/lang/String;)V

    sput-object v0, Ll0/q;->a:Ln0/l;

    new-instance v0, Ln0/l;

    const-string v1, "CLOSED_EMPTY"

    invoke-direct {v0, v1}, Ln0/l;-><init>(Ljava/lang/String;)V

    sput-object v0, Ll0/q;->b:Ln0/l;

    return-void
.end method

.method public static final synthetic a()Ln0/l;
    .locals 1

    .line 1
    sget-object v0, Ll0/q;->b:Ln0/l;

    return-object v0
.end method
