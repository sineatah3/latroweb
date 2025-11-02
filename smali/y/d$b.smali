.class public final Ly/d$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/e$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# static fields
.field static final synthetic a:Ly/d$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ly/d$b;

    invoke-direct {v0}, Ly/d$b;-><init>()V

    sput-object v0, Ly/d$b;->a:Ly/d$b;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
