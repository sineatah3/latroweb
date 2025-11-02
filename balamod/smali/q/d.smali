.class public abstract Lq/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Lq/d;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a()Lq/d;
    .locals 1

    .line 1
    sget-object v0, Lq/d;->a:Lq/d;

    if-nez v0, :cond_0

    new-instance v0, Lq/e;

    invoke-direct {v0}, Lq/e;-><init>()V

    sput-object v0, Lq/d;->a:Lq/d;

    :cond_0
    sget-object v0, Lq/d;->a:Lq/d;

    return-object v0
.end method
