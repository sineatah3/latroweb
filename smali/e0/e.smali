.class public abstract Le0/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le0/c;
.implements Ljava/io/Serializable;


# instance fields
.field private final d:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le0/e;->d:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p0}, Le0/f;->a(Le0/e;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "renderLambdaToString(this)"

    invoke-static {v0, v1}, Le0/d;->d(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method
