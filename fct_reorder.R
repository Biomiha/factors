Name <- c("Emma", "Olivia", "Ava", "Isabella", "Sophia", "Mia", "Charlotte", "Amelia", "Evelyn", "Abigail", "Harper", "Emily")
Height <- c(rnorm(n = 4, mean = 140, sd = 10), rnorm(n = 4, mean = 150, sd = 10), rnorm(n = 4, mean = 160, sd = 10))
Group <- rep(1:3, each = 4)

tibble(Group, Name, Height) %>% 
  arrange(Name) %>% 
  write_csv("Fct_reorder_reprex.csv")
df <- read_csv("Fct_reorder_reprex.csv")
df %>%
  dplyr::mutate(Group = as.factor(Group),
                Name = fct_reorder(Name, Group, identity)) %>% 
  ggplot(aes(x = Name, y = Height, fill = Group)) +
  geom_bar(stat = "identity")
