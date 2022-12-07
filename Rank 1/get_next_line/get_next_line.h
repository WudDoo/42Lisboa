/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.h                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mortins- <mortins-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/02 15:19:01 by mortins-          #+#    #+#             */
/*   Updated: 2022/12/07 16:10:40 by mortins-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef GET_NEXT_LINE_H
# define GET_NEXT_LINE_H

# ifndef BUFFER_SIZE
#  define BUFFER_SIZE 20
# endif

# include<unistd.h>
# include<stdlib.h>

char	*get_next_line(int fd);
char	*get_strjoin(char *s1, const char *s2);
int		check_newline(char *box);
size_t	ft_strlen(const char *s);

#endif
