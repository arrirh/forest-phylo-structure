load("clean.data/phylo-ses.rda")
hgt <- read.table("raw.data/hgt.txt")[[1]]

#_____________________________________________________________________


pdf("figures/tree-regs.pdf", 7, 22)

op <- par(mfcol = c(7,2))

for (i in 2:ncol(t.ses.z)){
  NRI <- -t.ses.z[, i]
  plot(hgt, NRI,  pch = 21, bg = "tomato", xlab = "altitude")
  
  sp <- cor.test(hgt, NRI, method = "spearman", use = "complete")
  
  sig <- t.ses.p[, i] < 0.05 | t.ses.p[, i] > 0.95
  points(hgt[sig], NRI[sig],  pch = 21, bg = "darkred")
  
  model <- lm(NRI ~ hgt)
  if (sp$p.value < 0.05)
  {
    abline(model)
  }
  legend("topright", legend = round(coef(model)[2]*100, 4), bty = "n")
  
  text("topleft", labels = "txt")
  legend("topleft", legend = bquote(rho == .({round(sp$estimate, 3)}) ~ "; " ~ p == .({round(sp$p.value, 3)})), bty = "n")
  
  title(main = paste0(names(t.ses.z)[i]))
}

par(op)

dev.off()


#_____________________________________________________________________


pdf("figures/shrub-regs.pdf", 7, 22)

op <- par(mfcol = c(7,2))

for (i in 2:ncol(t.ses.z)){
  NRI <- -s.ses.z[, i]
  plot(hgt, NRI,  pch = 21, bg = "skyblue", xlab = "altitude")
  
  sp <- cor.test(hgt, NRI, method = "spearman", use = "complete")
  
  sig <- s.ses.p[, i] < 0.05 | s.ses.p[, i] > 0.95
  points(hgt[sig], NRI[sig],  pch = 21, bg = "darkblue")
  
  model <- lm(NRI ~ hgt)
  if (sp$p.value < 0.05)
  {
    abline(model)
  }
  legend("topright", legend = round(coef(model)[2]*100, 4), bty = "n")
  
  text("topleft", labels = "txt")
  legend("topleft", legend = bquote(rho == .({round(sp$estimate, 3)}) ~ "; " ~ p == .({round(sp$p.value, 3)})), bty = "n")
  
  title(main = paste0(names(s.ses.z)[i]))
}

par(op)

dev.off()

#_____________________________________________________________________


pdf("figures/herb-regs.pdf", 7, 22)

op <- par(mfcol = c(7,2))

for (i in 2:ncol(t.ses.z)){
  NRI <- -h.ses.z[, i]
  plot(hgt, NRI,  pch = 21, bg = "limegreen", xlab = "altitude")
  
  sp <- cor.test(hgt, NRI, method = "spearman", use = "complete")
  
  sig <- h.ses.p[, i] < 0.05 | h.ses.p[, i] > 0.95
  points(hgt[sig], NRI[sig],  pch = 21, bg = "darkgreen")
  
  model <- lm(NRI ~ hgt)
  if (sp$p.value < 0.05)
  {
    abline(model)
  }
  legend("topright", legend = round(coef(model)[2]*100, 4), bty = "n")
  
  text("topleft", labels = "txt")
  legend("topleft", legend = bquote(rho == .({round(sp$estimate, 3)}) ~ "; " ~ p == .({round(sp$p.value, 3)})), bty = "n")
  
  title(main = paste0(names(h.ses.z)[i]))
}

par(op)

dev.off()
