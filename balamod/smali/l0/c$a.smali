.class public final Ll0/c$a;
.super Ly/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll0/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 1
    sget-object v0, Ly/d;->c:Ly/d$b;

    sget-object v1, Ll0/c$a$a;->e:Ll0/c$a$a;

    invoke-direct {p0, v0, v1}, Ly/b;-><init>(Ly/e$c;Ld0/a;)V

    return-void
.end method

.method public synthetic constructor <init>(Le0/b;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ll0/c$a;-><init>()V

    return-void
.end method
